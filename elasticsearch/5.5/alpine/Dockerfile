FROM openjdk:8-jre-alpine

MAINTAINER Kyle K. Lin <gazer.kanlin@gmail.com>

# Install required packages
RUN apk add --no-cache --update \
    bash \
    su-exec \
    openssl
    
# Create user
RUN adduser elastic -D

# Download, install
RUN set -x \
    && mkdir /opt \
    && cd /opt \
    && wget -q "https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.5.0.tar.gz" \
    && tar -xzf elasticsearch-5.5.0.tar.gz \
    && chown -R elastic:elastic /opt/elasticsearch-5.5.0 \
    && rm -r elasticsearch-5.5.0.tar.gz

RUN set -x \
    && mkdir /home/elastic/elasticsearch /home/elastic/elasticsearch/logs /home/elastic/elasticsearch/data \
    && chown -R elastic:elastic /home/elastic/elasticsearch
        
ENV PATH /opt/elasticsearch-5.5.0/bin:$PATH

ENV ES_CLUSTER_NAME=cluster1 \
    ES_NODE_NAME=node1 \
    ES_NODE_MASTER=true \
    ES_NODE_DATA=true \
    ES_NODE_INGEST=true \
    ES_HTTP_PORT=9200 \
    ES_ZEN_UNICAST_HOSTS="" \
    ES_ZEN_MIN_MASTER_NODES=1

# Swtich user
USER elastic

# Setup environment
COPY elasticsearch.yml /opt/elasticsearch-5.5.0/config
COPY docker-entrypoint /opt/elasticsearch-5.5.0/docker-entrypoint
    
# Setup working directory
WORKDIR /opt/elasticsearch-5.5.0

# Expose ports
EXPOSE 9200 9300
    
# Run
CMD ["/bin/bash", "./docker-entrypoint"]
