#!/bin/sh

alias rails='bundle exec rails'
alias rake='bundle exec rake'
alias serve='bundle exec foreman start'

function token {
  token=`curl -sX "POST" "http://localhost:3000/user_token" -H "Content-Type: application/json" -d '{"auth": {"email": "user1@jaga.jp", "password": "password"}}'`
  echo "Bearer `echo $token | cut -d'"' -f4`"
}