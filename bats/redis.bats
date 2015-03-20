#!/usr/bin/env bats

@test "redis-cli is in $PATH" {
    result=$(which redis-cli)
    [ -n "$result" ]
}

@test "redis-server is in $PATH" {
    result=$(which redis-server)
    [ -n "$result" ]
}

@test "redis-cli is executable" {
    result=$(which redis-cli)
    [ -x "$result" ]
}

@test "redis-server is executable" {
    result=$(which redis-server)
    [ -x "$result" ]
}

@test "redis-env-cli is executable" {
    result=$(which redis-env-cli)
    [ -x "$result" ]
}

@test "redis config is present" {
    [ -f "/etc/redis/redis.conf" ]
}
