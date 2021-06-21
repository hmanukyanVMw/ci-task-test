#!/usr/bin/env bash

. ./ci-task-test/Concurse/tasks/alert-message-create/shared_bash
set -eoux pipefail

alert_setup
alert_title "${TITLE}" "${TEAM}"
