#!/bin/bash

screen -dmS stats \
    docker run quarkchain pypy3 pyquarkchain/quarkchain/tools/stats \
        --ip=$(dig +short myip.opendns.com @resolver1.opendns.com)
