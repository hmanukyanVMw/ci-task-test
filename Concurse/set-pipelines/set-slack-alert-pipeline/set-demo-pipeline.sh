DOCKER_HOST="10.0.1.5"
DOCKER_TAG="latest"
BRANCH="main"
#docker-compose up -d
#fly --target tutorial trigger-job --job tutorial/get-product-envs --watch
#https:
# //hooks.slack.com/services/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
fly --target tutorial set-pipeline --config ./pipeline.yml  \
    --load-vars-from <(lpass show --notes "Shared-PCF Metrics/Catalyst/ci_vars.yml") \
    --var appwatch-service-account-json="$(lpass show --notes "bbl-appwatch service account")" \
     --var build-tag="build" \
    --var docker-host=${DOCKER_HOST} \
    --var docker-tag="${DOCKER_TAG}" \
    --var system-domain=sys.delreyoaks.cf-app.com \
    --var github-branch="${BRANCH}" \
    --var cf-username=admin \
    --var cf-password=poiO7PNM_Mefna-ZqDqIMtaK3Ilq5Fxl \
    --pipeline tutorial

