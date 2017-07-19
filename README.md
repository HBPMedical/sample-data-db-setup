[![CHUV](https://img.shields.io/badge/CHUV-LREN-AF4C64.svg)](https://www.unil.ch/lren/en/home.html) [![License](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](https://github.com/LREN-CHUV/sample-data-db-setup/blob/master/LICENSE) [![DockerHub](https://img.shields.io/badge/docker-hbpmip%2Fdata--db--setup-008bb8.svg)](https://hub.docker.com/r/hbpmip/sample-data-db-setup/) [![Codacy Badge](https://api.codacy.com/project/badge/Grade/bb61058330e04b8196e4f991abcfbba4)](https://www.codacy.com/app/hbp-mip/sample-data-db-setup?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=LREN-CHUV/sample-data-db-setup&amp;utm_campaign=Badge_Grade)
[![CircleCI](https://circleci.com/gh/LREN-CHUV/sample-data-db-setup.svg?style=svg)](https://circleci.com/gh/LREN-CHUV/sample-data-db-setup)


# MIP Sample database setup

Setup a database with one table containing sample data.

## How to build the Docker image

Run: `./build.sh`

# Setup for database 'sample-data-db' with the selection of variables for sample

## Introduction

This project uses Flyway to manage the database migration scripts for the 'sample-data-db' database used by MIP.

This database contains the data used for testing and debugging purposes.

## Usage

Run:

```console
$ docker run -i -t --rm -e FLYWAY_HOST=`hostname` hbpmip/sample-meta-db-setup:0.1.0 migrate
```

where the environment variables are:

* FLYWAY_HOST: database host, default to 'db'.
* FLYWAY_PORT: database port, default to 5432.
* FLYWAY_DATABASE_NAME: name of the database or schema, default to 'data'
* FLYWAY_URL: JDBC url to the database, constructed by default from FLYWAY_DBMS, FLYWAY_HOST, FLYWAY_PORT and FLYWAY_DATABASE_NAME
* FLYWAY_DRIVER: Fully qualified classname of the jdbc driver (autodetected by default based on flyway.url)
* FLYWAY_USER: database user, default to 'data'.
* FLYWAY_PASSWORD: database password, default to 'data'.
* FLYWAY_SCHEMAS: Optional, comma-separated list of schemas managed by Flyway
* FLYWAY_TABLE: Optional, name of Flyway's metadata table (default: schema_version)

## Build

Run: `./build.sh`

## Publish on Docker Hub

Run: `./publish.sh`

## License

Copyright (C) 2017 [LREN CHUV](https://www.unil.ch/lren/en/home.html)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0
