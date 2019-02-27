#!/bin/bash

echo "====================> UPGRADING NPM"
npm install -g npm;
echo "====================> INSTALLING YEOMAN"
npm install -g yo;
echo "====================> INSTALLING JHIPSTER"
npm install -g generator-jhipster;

echo "Congratulations, you are now a true JHipster"