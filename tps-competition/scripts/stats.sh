#!/bin/bash

NODE_IP=$(dig +short myip.opendns.com @resolver1.opendns.com)

docker run -d --name stats quarkchain pypy3 pyquarkchain/quarkchain/tools/stats --ip=${NODE_IP}

