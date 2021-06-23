DOCKER_HOST="10.0.1.5"
DOCKER_TAG="latest"

#docker-compose up -d

fly --target tutorial set-pipeline --config ./pipeline.yml  \
    --load-vars-from <(lpass show --notes "Shared-PCF Metrics/Catalyst/ci_vars.yml") \
    --var appwatch-service-account-json="$(lpass show --notes "bbl-appwatch service account")" \
    --var docker-host=${DOCKER_HOST} \
    --var docker-tag="${DOCKER_TAG}" \
    --var system-domain=sys.delreyoaks.cf-app.com \
    --var cf-username=admin \
    --var cf-password=poiO7PNM_Mefna-ZqDqIMtaK3Ilq5Fxl \
    --pipeline tutorial

