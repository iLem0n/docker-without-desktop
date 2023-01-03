#!/bin/bash

HOST_ENV="export DOCKER_HOST=tcp://127.0.0.1:2375" 


grep -qxF '$HOST_ENV' ~/.bash_profile || echo $HOST_ENV >> ~/.bash_profile

# if you are using 'fish'-shell
grep -qxF '$HOST_ENV' ~/.config/fish/config.fish || echo $HOST_ENV >> ~/.config/fish/config.fish
