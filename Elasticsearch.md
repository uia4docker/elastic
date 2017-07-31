Elasticsearch Meets Docker
===

# Paths
* Elasticsearch - /usr/share/elasticsearch

* Data
  * /usr/share/elasticsearch/data

  * /home/elastic/elasticsearch/data

* Logs
  * /usr/share/elasticsearch/logs

  * /home/elastic/elasticsearch/logs


* Configuration
  * /etc/elasticsearch

  * /elasticsearch-__{VERSION}__/config
    * elasticsearch.yml
    * log4j2.properties

# Runtime Configuration

## Environment Variables
* ES_CLUSTER_NAME - Cluster name。

* ES_NODE_NAME - Node name。

* ES_NODE_MASTER - Master node or not. Default value is __true__。

* ES_NODE_DATA - Data node or not. Default value is __true__。

* ES_NODE_INGEST - Ingest node or not. Default value is __true__。

* ES_NETWORK_HOST - Network address. Default is __$HOSTNAME__.

* ES_HTTP_PORT - Port. Default is __9200__.

* ES_ZEN_UNICAST_HOSTS -

* ES_ZEN_MIN_MASTER_NODES - Default value is __1__.

### Example 1
Run a container with specific cluster name and node name.
```
docker run \
    -d \
    --hostname=svr1 \
    -e ES_CLUSTER_NAME=cluster1 \
    -e ES_NODE_NAME=svr1 \
    -p 9200:9200 \
    -p 9300:9300 \
    uiarch/elasticsearch:5.5
```
### Example 2
Run a container as a Coordinating Only Node.
```
docker run \
    -d \
    --hostname=svr1 \
    -e ES_NODE_MASTER=false \
    -e ES_NODE_DATA=false \
    -e ES_NODE_INGEST=false \
    -p 9200:9200 \
    -p 9300:9300 \
    uiarch/elasticsearch:5.5
```

### Example 3
 Run a container.
```
docker run \
    -d \
    -p 9200:9200 \
    -p 9300:9300 \
    uiarch/elasticsearch:5.5
```


## Elasticsearch.yml
node.name

node.master

node.data

node.ingest

transport.host

transport.tcp.port

bootstrap.memory_lock

discovery.zen.ping.unicast.hosts

discovery.zen.minimum_master_nodes

http.cors.enabled:

http.cors.allow-origin:

## Example
```
docker run \
    -d \
    -e node.master=true \
    -e node.data=true \
    -e network.host=172.17.0.2 \
    -e ... \
    -p 9200:9200 \
    -p 9300:9300 \
    uiarch/elasticsearch:5.5
```
