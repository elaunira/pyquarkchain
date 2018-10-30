#!/bin/bash

# $1 NUM_SLAVES
# $2 NUM_SHARDS
# $3 BOOTSTRAP_NODE_IP

NODE_IP=$(dig +short myip.opendns.com @resolver1.opendns.com)

docker run -d -p 38291:38291 -p 38391:38391 -p 38491:38491 -p 8000:8000 -p 29000:29000 --name cluster \
    quarkchain pypy3 pyquarkchain/quarkchain/cluster/cluster.py \
        --devp2p_enable \
        --devp2p_ip=${NODE_IP} \
        --devp2p_bootstrap_host=$3 \
        --num_slaves $1 \
        --num_shards $2 \
        --root_block_interval_sec 120 \
        --minor_block_interval_sec 20 \
        --clean

echo "Cluster node started, IP=${NODE_IP}"
