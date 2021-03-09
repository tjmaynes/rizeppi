# Originally found here: https://stackoverflow.com/a/32592965
kill_process_on_port() {
    PORT=$1
    
    if [[ -z $PORT ]]; then
        echo "Please provide a PORT to kill process from."
    else
        kill -9 "$(lsof -t -i:$PORT)" || true
    fi
}

run_app() {
    PORT=$1
    
    pushd src/Server
    dotnet run & npx wait-on "https://localhost:$PORT"
    popd
}

run_app_and() {
    kill_process_on_port 5001
    
    run_app 5001
    
    eval "$1"
    
    kill_process_on_port 5001
}