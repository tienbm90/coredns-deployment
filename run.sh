#! /bin/bash

export ETCD_VERSION=3.3.11
export COREDNS_VERSION=latest
export DOCKER_HOST_IP=$(ip route get 1.1.1.1 | awk 'NR==1 { print $7 }')
export ETCDCTL_API=3
# RUN docker-compose
docker-compose up -d
sleep 2
# Create some test data
# Create forward data
etcdctl put /skydns/com/example/server1/  "{\"host\":\"172.16.10.1\",\"ttl\":60}"
etcdctl put /skydns/com/example/server2/  "{\"host\":\"172.16.10.2\",\"ttl\":60}"
etcdctl put /skydns/com/example/server3/  "{\"host\":\"172.16.10.3\",\"ttl\":60}"
etcdctl put /skydns/com/example/server4/  "{\"host\":\"172.16.10.4\",\"ttl\":60}"
etcdctl put /skydns/arpa/in-addr/172/16/10/1/ '{"host": "server1.example.com."}'
etcdctl put /skydns/arpa/in-addr/172/16/10/2/ '{"host": "server2.example.com"}'
etcdctl put /skydns/arpa/in-addr/172/16/10/3/ '{"host": "server3.example.com"}'
etcdctl put /skydns/arpa/in-addr/172/16/10/4/ '{"host": "server4.example.com"}'