Formats
-------

### Split event
Single event with array of object has been split to multiple events
#### Event metadaa

#### Fields :
* `id`
  * Description : ID of an event
  * type: string
  * example values:

#### Example sources
Source:
```json
[
  {
    "results": [
      {
        "id": "a1",
        "name": "hello"
      },
      {
        "id": "a2",
        "name": "logstash"
      }
    ]
  }
]
```
Result:
```json
[
  {
    "@version": "1",
    "@timestamp": "2015-06-04T22:35:39.313Z",
    "host": "zip",
    "result": {
      "id": "a1",
      "name": "hello"
    }
  },
  {
    "@version": "1",
    "@timestamp": "2015-06-04T22:35:39.313Z",
    "host": "zip",
    "type": "clone",
    "result": {
      "id": "a2",
      "name": "logstash"
    }
  }
]
```
