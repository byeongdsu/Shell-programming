#!/bin/bash

run_ls() {
    local opts="$*"       
    echo "[실행 명령어] ls $opts"
    eval "ls $opts"         
}

run_ls "$@"
