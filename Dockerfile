# Build stage for quality control
FROM python:3.6.1-alpine as data-qc-env

RUN apk add --no-cache python3-dev build-base
RUN pip3 install --no-cache-dir goodtables csvkit==1.0.2

COPY data/ /data/
WORKDIR /data

# Produce a validation report, plus a readable report if there is an error

RUN goodtables validate -o datapackage.checks --json datapackage.json || goodtables validate datapackage.json
RUN test $(grep -c "loading error" datapackage.checks) -eq 0

RUN csvstat churn.csv | tee churn.stats
RUN csvstat desd-synthdata.csv | tee desd-synthdata.stats
RUN csvstat iris.csv | tee iris.stats
RUN csvstat linreg_sample.csv | tee linreg_sample.stats
RUN csvstat nida-synthdata.csv | tee nida-synthdata.stats
RUN csvstat qqni-synthdata.csv | tee qqni-synthdata.stats

# Final image
FROM hbpmip/data-db-setup:2.6.1

COPY --from=data-qc-env /data/*.stats /data/*.checks /data/
COPY data/ /data/
COPY sql/V1_0__create.sql \
     sql/V1_1__churn.sql \
     sql/V1_2__iris.sql \
     sql/V1_3__dummy_ldsm.sql \
     sql/V1_4__dummy_federation.sql \
     sql/V1_5__synthetic_datasets.sql \
     sql/V1_6__mixed_datasets.sql \
     sql/V1_7__cde_upgrades.sql \
       /flyway/sql/

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

ENV IMAGE=hbpmip/sample-data-db-setup:$VERSION \
    DATAPACKAGE=/data/datapackage.json

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
