Elasticsearch Meets Docker
===

# Layout
* Intallation - /usr/share/elasticsearch-__{VERSION}__

* Volume: data - /usr/share/elasticsearch-__{VERSION}__/data

* Volume: logs - /usr/share/elasticsearch-__{VERSION}__/logs

* Expose - 9200, 9300

# Runtime Configuration

## Environment Variables
* ES_CLUSTER_NAME - Cluster name。

* ES_NODE_NAME - Node name。

* ES_NODE_MASTER - Master node or not. Default value is __true__。

* ES_NODE_DATA - Data node or not. Default value is __true__。

* ES_NODE_INGEST - Ingest node or not. Default value is __true__。

* ES_NETWORK_HOST - Network address. Default value is __$HOSTNAME__.

* ES_HTTP_PORT - Port. Default value is __9200__.

* ES_ZEN_UNICAST_HOSTS -

* ES_ZEN_MIN_MASTER_NODES - Default value is __1__.


### Example 1
 Run a container.
```
docker run \
    -d \
    -p 9200:9200 \
    -p 9300:9300 \
    uiarch/elasticsearch:5.5
```

### Example 2
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
### Example 3
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
