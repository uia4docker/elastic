@echo off
docker run ^
    -d ^
    --name=esvr1 ^
    --hostname=esvr1 ^
    -e ES_NODE_NAME=esvr1 ^
    -p 9200:9200 ^
    -p 9300:9300 ^
    uiarch/elasticsearch:5.5
