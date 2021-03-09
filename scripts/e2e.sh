#!/bin/bash

set -e

# Originally found here: https://stackoverflow.com/a/32592965
kill_process_on_port() {
  PORT=$1
  if [[ -z $PORT ]]; then
    echo "Please provide a PORT to kill process from."
  else
    kill -9 "$(lsof -t -i:$PORT)" || true
  fi
}

main() {
  kill_process_on_port 5001

  pushd src/Server
  dotnet run & npx wait-on https://localhost:5001
  popd

  pushd ./test/e2e
  npx cypress run --headless
  popd

  kill_process_on_port 5001
}

main