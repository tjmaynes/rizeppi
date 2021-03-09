#!/bin/bash

set -e

main() {
  source scripts/common.sh

  run_app_and $(cd ./tests/e2e && npx cypress run --headless && cd -)
}

main