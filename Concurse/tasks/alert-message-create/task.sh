#!/usr/bin/env bash

. ./ci-task-test/Concource/tasks/alert-message-create/shared_bash
set -eoux pipefail

alert_setup
alert_title "${TITLE}" "${TEAM}"
