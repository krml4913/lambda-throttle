#!/bin/bash

ENV_SHELL=$(pwd)/.devcontainer/shells/local-env.sh
if [ -f $ENV_SHELL ]; then
    $ENV_SHELL
fi
