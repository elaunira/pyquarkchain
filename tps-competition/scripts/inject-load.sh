#!/bin/bash

# $1 NB_TRANSACTIONS 
# $2 CROSS_SHARD_PERCENTAGE

docker run --name load-injector \
    quarkchain pypy3 -c 'import jsonrpcclient; jsonrpcclient.request("http://172.17.0.1:38491", "createTransactions", numTxPerShard='$1', xShardPercent='$2')'

