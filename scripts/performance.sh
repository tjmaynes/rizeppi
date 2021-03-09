#!/bin/bash

set -e

main() {
  source scripts/common.sh

  run_app_and $(cd ./tests/performance && npx lhci autorun && cd -)
}

main
