#!/usr/bin/env bats

setup() {
    runsv /etc/service/redis &
    while [ -n "$(sv status redis | grep \"down\")" ]
    do
      sv start redis
    done
}

@test "set and get key from redis" {
    redis-cli set "test" "1"
    result="$(redis-cli get "test")"
    [ "$result" -eq "1" ]
}

teardown(){
    sv shutdown redis
}
