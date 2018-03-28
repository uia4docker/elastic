@echo off
docker run ^
    -d ^
    --name=esvr1 ^
    --hostname=esvr1 ^
    -e ES_NODE_NAME=esvr1 ^
    -p 9200:9200 ^
    -p 9300:9300 ^
    es:6.2.2
