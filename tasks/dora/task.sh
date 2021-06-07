#!/bin/bash

cf api api.${SYSTEM_DOMAIN} --skip-ssl-validation
cf auth ${CF_USERNAME} ${CF_PASSWORD}
cf target -o system -s system

pushd dora-src/assets/dora
  cf push dora
popd
