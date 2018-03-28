FROM uiarch/jre:8

MAINTAINER Kyle K. Lin <gazer.kanlin@gmail.com>

# Create user
RUN groupadd -g 1000 elastic && \
    adduser -u 1000 -g 1000 -d /usr/share/elasticsearch-6.2.2 elastic

# Setup working directory
ENV ELASTIC_CONTAINER true
WORKDIR /usr/share/elasticsearch-6.2.2

# Download, install
RUN set -x \
    && cd /usr/share \
    && curl https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.2.2.tar.gz > elasticsearch-6.2.2.tar.gz \
    && tar -xzf elasticsearch-6.2.2.tar.gz \
    && rm -r elasticsearch-6.2.2.tar.gz

USER 1000

ENV PATH /usr/share/elasticsearch-6.2.2/bin:$PATH

ENV ES_CLUSTER_NAME=cluster1 \
    ES_NODE_NAME=node1 \
    ES_NODE_MASTER=true \
    ES_NODE_DATA=true \
    ES_NODE_INGEST=true \
    ES_HTTP_PORT=9200 \
    ES_TRANSPORT_HOST=localhost \
    ES_ZEN_UNICAST_HOSTS="" \
    ES_ZEN_MIN_MASTER_NODES=1

# Setup environment
COPY --chown=1000:0 elasticsearch.yml /usr/share/elasticsearch-6.2.2/config
COPY --chown=1000:0 docker-entrypoint /usr/share/elasticsearch-6.2.2/docker-entrypoint

# Define mountable directories
VOLUME ["/usr/share/elasticsearch-6.2.2/data", "/usr/share/elasticsearch-6.2.2/logs"]

USER 0
RUN set -x \
    && chown -R elastic:0 /usr/share/elasticsearch-6.2.2 \
    && chmod -R 775 /usr/share/elasticsearch-6.2.2

USER 1000

# Expose ports
EXPOSE 9200 9300
    
# Run
CMD ["/bin/bash", "./docker-entrypoint"]
