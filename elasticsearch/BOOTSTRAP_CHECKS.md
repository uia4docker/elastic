# Bootstrap Checks
[Doc Reference](https://www.elastic.co/guide/en/elasticsearch/reference/current/bootstrap-checks.html)

## Heap size
[JVM options Reference](https://www.elastic.co/guide/en/elasticsearch/reference/current/jvm-options.html)
### How-To
* use __jvm.options__ file.
```
-Xmx2g
```
* use __ES_JAVA_OPTS__ environment property.
```
ES_JAVA_OPTS="-Xms2g -Xmx2g"
```

### Check
```
GET _cat/nodes?h=heap*&v
```


## File descriptor


## Memory lock
[Dco Reference](https://www.elastic.co/guide/en/elasticsearch/reference/current/setup-configuration-memory.html#disable-swap-files)
### How-To
1. Disable all swap files

  * Temporarily
```
sudo swapoff -a
```
  * Permanently: update __/etc/fstab__ by commenting out any lines that contain word ```swap```.

* Add configuration to config/elasticsearch.yml
```
bootstrap.memory_lock: true
```

### Check
```
GET _nodes?filter_path=**.mlockall
```


## Maximum number of threads


## Maximum size virtual Memory


## Maximum file size


##  Maximum map count


## Client JVM


## Use serial collector


## System call filter


## OnError and OutOfMemoryError


## Early-access


## G1GC


## All permission
