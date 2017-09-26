[![CHUV](https://img.shields.io/badge/CHUV-LREN-AF4C64.svg)](https://www.unil.ch/lren/en/home.html) [![License](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](https://github.com/LREN-CHUV/sample-data-db-setup/blob/master/LICENSE) [![DockerHub](https://img.shields.io/badge/docker-hbpmip%2Fdata--db--setup-008bb8.svg)](https://hub.docker.com/r/hbpmip/sample-data-db-setup/) [![Codacy Badge](https://api.codacy.com/project/badge/Grade/bb61058330e04b8196e4f991abcfbba4)](https://www.codacy.com/app/hbp-mip/sample-data-db-setup?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=LREN-CHUV/sample-data-db-setup&amp;utm_campaign=Badge_Grade)
[![CircleCI](https://circleci.com/gh/LREN-CHUV/sample-data-db-setup.svg?style=svg)](https://circleci.com/gh/LREN-CHUV/sample-data-db-setup)


# Sample database setup

Setup a database with one table containing sample data.

## How to build the Docker image

Run: `./build.sh`

# Setup for database 'sample-data-db' with the selection of variables for sample

## Introduction

This Docker image uses Flyway to manage the database migration scripts for the 'sample-data-db' database used by MIP.

This database contains the data used for testing and debugging purposes.

## Usage

Run:

```console
$ docker run -i -t --rm -e FLYWAY_HOST=`hostname` hbpmip/sample-data-db-setup:0.2.0 migrate
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

After execution, you should have:

* A table named **SAMPLE_DATA** containing the values of dataset linreg_sample.csv

## Build

Run: `./build.sh`

## Publish on Docker Hub

Run: `./publish.sh`

## Contents of dataset linreg_sample.csv

Dataset generated from https://richarddmorey.shinyapps.io/test/solve.Rmd using ID number 2049324 and secret 's3Cr34'

First perform the linear regression analysis with only score.math.course1 as the independent variable, then perform the linear regression analysis with both high school math courses as predictors.

```

Solution
term 	estimate 	std.error 	statistic 	p.value
(Intercept) 	1.1577 	1.7023 	0.6801 	0.4975
score.math.course1 	1.0253 	0.0288 	35.5961 	0.0000

Report (p) values for both slopes.
Solution
term 	estimate 	std.error 	statistic 	p.value
(Intercept) 	-2.2264 	2.0310 	-1.0962 	0.2748
score.math.course1 	0.2020 	0.2856 	0.7072 	0.4806
score.math.course2 	0.8098 	0.2796 	2.8964 	0.0044

Report (R^2) and adjusted (R^2).
Solution
	Dependent variable:

	college.math
score.math.course1 	0.202
	(0.286)

score.math.course2 	0.810***
	(0.280)

Constant 	-2.226
	(2.031)

Observations 	150
R2 	0.901
Adjusted R2 	0.900
Residual Std. Error 	9.551 (df = 147)
F Statistic 	669.368*** (df = 2; 147)
Note: 	p<0.1; p<0.05; p<0.01

```

## License

Copyright (C) 2017 [LREN CHUV](https://www.unil.ch/lren/en/home.html)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0
