# Build stage for statistics
FROM python:3.6.1-alpine as build-stats-env

RUN pip install --no-cache-dir csvkit==1.0.2

COPY sql/linreg_sample.csv /data/linreg_sample.csv
COPY sql/churn.csv \
     sql/iris.csv \
     sql/desd-synthdata.csv \
     sql/nida-synthdata.csv \
     sql/qqni-synthdata.csv \
       /data/

WORKDIR /data
RUN for f in *.csv ; do csvstat $f > ${f/.csv/.stats} ; done

# Recover the jar from the parent image
FROM hbpmip/data-db-setup:2.2.0 as parent-image

# Build stage for Java classes
FROM maven:3.5.2-jdk-8-alpine as build-java-env

COPY --from=parent-image /usr/share/jars/data-db-setup.jar /flyway/jars/
COPY src/main/java/ /project/src/

WORKDIR /project/src
RUN jar uvf /flyway/jars/data-db-setup.jar -C . .

# Final image
FROM hbpmip/data-db-setup:2.2.0

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

COPY --from=build-stats-env /data /data
COPY --from=build-java-env /flyway/jars/data-db-setup.jar /flyway/jars/data-db-setup.jar
COPY sql/V1_0__create.sql \
     sql/V1_1__churn.sql \
     sql/V1_2__iris.sql \
     sql/V1_3__dummy_ldsm.sql \
     sql/V1_4__dummy_federation.sql \
     sql/V1_5__synthetic_datasets.sql \
     sql/V1_6__mixed_datasets.sql \
       /flyway/sql/

ENV IMAGE=hbpmip/sample-data-db-setup:0.6.0 \
    DATASETS=linreg_sample,churn,iris,desd_synth,nida_synth,qqni_synth,desd_mixed,nida_mixed,qqni_mixed

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="hbpmip/sample-data-db-setup" \
      org.label-schema.description="Research database setup usin/home/hbpuserg the MIP Common Data Elements" \
      org.label-schema.url="https://github.com/LREN-CHUV/sample-data-db-setup" \
      org.label-schema.vcs-type="git" \
      org.label-schema.vcs-url="https://github.com/LREN-CHUV/sample-data-db-setup" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.version="$VERSION" \
      org.label-schema.vendor="LREN CHUV" \
      org.label-schema.license="Apache2.0" \
      org.label-schema.docker.dockerfile="Dockerfile" \
      org.label-schema.schema-version="1.0"
