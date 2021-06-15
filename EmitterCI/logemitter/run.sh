   cf push "logger-1" \
	           -p ~/workspace/loggregator-tools/logemitter \
             -b go_buildpack \
             -m 32m \
             -k 32m \
             --no-start \
             --health-check-type process

  cf set-env "logger-1" EMIT_INTERVAL 1ms
  cf set-env "logger-1" EMIT_ITERATION 1000
  cf start "logger-1"
  cf logs logger-1 --recent
