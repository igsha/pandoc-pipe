#!/usr/bin/env bash
set -e

which jq > /dev/null

fail() {
    status=$?
    echo ${BASH_LINENO[0]}: "$@" >& 2
    exit $status
}

< test1.json ./pandoc-pipe | jq ".blocks[] | .t, .c[]" | {
    readarray -t ARR
    [[ ${ARR[0]} == '"RawBlock"' ]] || fail "Wrong block type"
    [[ ${ARR[1]} == '"html"' ]] || fail "Wrong text type"
    [[ ${ARR[2]} == '"this is linespaces\nanother line\nnew line\n"' ]] || fail "Wrong text"
}

< test2.json ./pandoc-pipe | jq ".blocks[] | .t, .c[]" | {
    readarray -t ARR
    [[ ${ARR[0]} == '"RawBlock"' ]] || fail "Wrong block type"
    [[ ${ARR[1]} == '"html"' ]] || fail "Wrong text type"
    [[ ${ARR[2]} == '"Code block\n   does not skip my\n\n sentences and spaces   "' ]] || fail "Wrong text"
}
