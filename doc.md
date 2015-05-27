Formats
-------

### Common Log Format-like logs

#### Event metadaa

#### Fields :
* `http_timestamp`
  * Description : HTTP Timestamp
  * type: string
  * example values:
    * `"26/May/2015:21:56:51 -0700"`
* `request`
  * Description : HTTP Request first line
  * type: string
  * example values:
    * `"POST /url HTTP/1.1"`
* `client_ip`
  * Description : IP Address of the client
  * example values:
    * `"192.168.1.10"`
* `response`
  * Description : Response status code
  * type: int
  * example values:
    * `200`
* `response_time`
  * Description : Time that server takes to respond
  * type: int
  * example values:
    * `50`

#### Example sources
Source:
```json
[
  {
    "format": "selvam",
    "message": "192.168.1.10 - - [26/May/2015:21:56:51 -0700] \"POST /url HTTP/1.1\" 200 50"
  }
]
```
Result:
```json
[
  {
    "format": "selvam",
    "message": "192.168.1.10 - - [26/May/2015:21:56:51 -0700] \"POST /url HTTP/1.1\" 200 50",
    "@version": "1",
    "@timestamp": "2015-05-27T04:56:51.000Z",
    "host": "zip",
    "client_ip": "192.168.1.10",
    "http_timestamp": "26/May/2015:21:56:51 -0700",
    "request": "POST /url HTTP/1.1",
    "response": 200,
    "response_time": 50,
    "tags": [
      "matched_above_10"
    ]
  }
]
```
