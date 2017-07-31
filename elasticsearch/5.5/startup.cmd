@echo off
docker run ^
    -ti ^
    --rm ^
    --name=esvr1 ^
    --hostname=esvr1 ^
    -e ES_NODE_NAME=esvr1 ^
    -v D:/Dev/DOCKER/centos7_es/5.5/data:/usr/share/elasticsearch/data ^
    -v D:/Dev/DOCKER/centos7_es/5.5/logs:/usr/share/elasticsearch/logs ^
    -p 9200:9200 ^
    -p 9300:9300 ^
    es
