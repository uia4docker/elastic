# Helpers

## 1. Update default number of shards
[Doc Reference](https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-templates.html)
```json
PUT _template/default
{
  "index_patterns": ["*"],
  "settings": {
    "number_of_shards": 3
  }
}
```

## 2. Delaying allocation when a node leaves
[Doc Reference](https://www.elastic.co/guide/en/elasticsearch/reference/current/delayed-allocation.html)
```json
PUT _all/_settings
{
  "settings": {
    "index.unassigned.node_left.delayed_timeout": "5m"
  }
}
```
