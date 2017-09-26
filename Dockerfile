# Build stage for statistics
FROM python:3.6.1-alpine as build-stats-env

RUN pip install --no-cache-dir csvkit==1.0.2

COPY sql/linreg_sample.csv /data/linreg_sample.csv
COPY sql/churn.csv /data/churn.csv

RUN csvstat /data/linreg_sample.csv > /data/linreg_sample.stats \
    && csvstat /data/churn.csv > /data/churn.stats

# Recover the jar from the parent image
FROM hbpmip/data-db-setup:2.1.3 as parent-image

# Build stage for Java classes
FROM maven:3.5.0-jdk-8-alpine as build-java-env

COPY --from=parent-image /usr/share/jars/data-db-setup.jar /flyway/jars/
COPY src/main/java/ /project/src/

WORKDIR /project/src
RUN jar uvf /flyway/jars/data-db-setup.jar -C . .

# Final image
FROM hbpmip/data-db-setup:2.1.3

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

COPY --from=build-stats-env /data /data
COPY --from=build-java-env /flyway/jars/data-db-setup.jar /flyway/jars/data-db-setup.jar
COPY sql/V1_0__create.sql /flyway/sql/V1_0__create.sql
COPY sql/V1_1__churn.sql /flyway/sql/V1_1__churn.sql
COPY docker/run.sh /

RUN chmod +x /run.sh

ENV DATASETS linreg_sample,churn

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="hbpmip/sample-data-db-setup" \
      org.label-schema.description="Research database setup using the MIP Common Data Elements" \
      org.label-schema.url="https://github.com/LREN-CHUV/sample-data-db-setup" \
      org.label-schema.vcs-type="git" \
      org.label-schema.vcs-url="https://github.com/LREN-CHUV/sample-data-db-setup" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.version="$VERSION" \
      org.label-schema.vendor="LREN CHUV" \
      org.label-schema.license="Apache2.0" \
      org.label-schema.docker.dockerfile="Dockerfile" \
      org.label-schema.schema-version="1.0"
