FROM uiarch/jre:8

MAINTAINER Kyle K. Lin <gazer.kanlin@gmail.com>

# SETUP elasticsearch repo.
ADD elasticsearch.repo /etc/yum.repos.d/elasticsearch.repo

# INSTALL elasticsearch
RUN rpm --import http://packages.elastic.co/GPG-KEY-elasticsearch; \
    yum -y install elasticsearch-5.5.0; \
    yum -y clean all; \
    chown -R elasticsearch:elasticsearch \
        /etc/elasticsearch \
        /usr/share/elasticsearch

# COPY configurtion file
COPY elasticsearch.yml /etc/elasticsearch/

# SETUP elasticsearch ENV.

ENV ES_CLUSTER_NAME=cluster1 \
    ES_NODE_NAME=node1 \
    ES_NODE_MASTER=true \
    ES_NODE_DATA=true \
    ES_NODE_INGEST=true \
    ES_HTTP_PORT=9200 \
    ES_ZEN_UNICAST_HOSTS="" \
    ES_ZEN_MIN_MASTER_NODES=1

# SETUP PATH
ENV PATH /usr/share/elasticsearch/bin:$PATH

# SETUP working directory
WORKDIR /usr/share/elasticsearch

# COPY es-docker
COPY es-docker es-docker

# CHANGE es-docker owner & group
RUN chown elasticsearch:elasticsearch es-docker; \
    chmod 0750 es-docker
    
# SWITCH user
USER elasticsearch

# EXPORE ports
EXPOSE 9200 9300

# RUN es-docker
CMD ["/bin/bash", "./es-docker"]
