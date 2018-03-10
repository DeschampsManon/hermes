#!/bin/bash

printf "bundle install ... \n"
bundle install

printf "db migrate ... \n"
bin/rails db:migrate

printf "launching hermes for port 5000 .... \n"
bin/rails s -p 5000
