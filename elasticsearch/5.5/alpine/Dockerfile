FROM openjdk:8-jre-alpine

MAINTAINER Kyle K. Lin <gazer.kanlin@gmail.com>

# Install required packages
RUN apk add --no-cache --update \
    bash \
    su-exec \
    openssl

# Download, install
RUN set -x \
    && adduser -D elastic \
    && wget -q "https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.5.0.tar.gz" \
    && tar -xzf "elasticsearch-5.5.0.tar.gz" \
    && chown -R elastic:elastic /elasticsearch-5.5.0 \
    && rm -r elasticsearch-5.5.0.tar.gz

RUN set -x \
    && mkdir /home/elastic/elasticsearch /home/elastic/elasticsearch/logs /home/elastic/elasticsearch/data \
    && chown -R elastic:elastic /home/elastic/elasticsearch
        
ENV PATH /elasticsearch-5.5.0/bin:$PATH

# Setup environment
COPY elasticsearch.yml /elasticsearch-5.5.0/config
COPY es-docker /elasticsearch-5.5.0/es-docker

ENV ES_CLUSTER_NAME=cluster1 \
    ES_NODE_NAME=node1 \
    ES_NODE_MASTER=true \
    ES_NODE_DATA=true \
    ES_NODE_INGEST=true \
    ES_HTTP_PORT=9200 \
    ES_ZEN_UNICAST_HOSTS="" \
    ES_ZEN_MIN_MASTER_NODES=1
    
WORKDIR /elasticsearch-5.5.0

# Swtich user
USER elastic

# Expose ports
EXPOSE 9200 9300
    
CMD ["/bin/bash", "./es-docker"]
