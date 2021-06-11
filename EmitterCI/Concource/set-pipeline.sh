#!/bin/bash
DOCKER_TAG="latest"

fly --target tutorial set-pipeline --config "pipeline.yml"  \
    --var docker-tag="${DOCKER_TAG}" \
    --var pws-username="${admin}" \
    --var pws-password="${poiO7PNM_Mefna-ZqDqIMtaK3Ilq5Fxl}" \
    --var system-domain=sys.delreyoaks.cf-app.com \
    --var docker-hub-password=DocVMwdeno_!9Hms^ \
    --var cf-password=poiO7PNM_Mefna-ZqDqIMtaK3Ilq5Fxl \
    -l /Users/hmanukyan/workspace/loggregator-ci/pipelines/config/acceptance-environment.yml \
    -l /Users/hmanukyan/workspace/loggregator-ci/pipelines/config/development-environment.yml \
    -l /Users/hmanukyan/workspace/loggregator-ci/pipelines/config/cats-testing.yml \
    --pipeline tutorial
