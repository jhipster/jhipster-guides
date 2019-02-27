#!/bin/bash

curl -sS https://repo1.maven.org/maven2/io/gatling/highcharts/gatling-charts-highcharts-bundle/2.3.1/gatling-charts-highcharts-bundle-2.3.1-bundle.zip > gatling.zip
unzip gatling && rm gatling.zip
mv gatling-charts-highcharts-bundle-2.3.1 ~/jhipster-guides/gatling