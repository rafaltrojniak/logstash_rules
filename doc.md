Formats
-------

### Common Log Format
This is commonly used log format for storing information about HTTP requests processed by HTTP server like Apache
#### Event metadaa
* time source field : @clf.timestamp
#### Fields :
* @clf.method
  * Description : HTTP Request method
  * type: string
  * example values:
    * "GET"
    * "POST"
    * "HEAD"
* @clf.method
  * Description : HTTP authorized user
  * type: string
  * example values:
    * "john"
    * nil
* group
  * Description : HTTP authorized group
  * optional: true
* request
  * Description : HTTP request line
  * type: string
  * optional: true
  * example values:
    * "GET / HTTP/1.1"

#### Example sources
Source:
```json
[
  {
    "format": "clf",
    "message": "127.0.0.1 user-identifier frank [12/Oct/2001:13:55:36 -0700] \"GET /apache_pb.gif HTTP/1.0\" 200 2326"
  }
]
```
Result:
```json
[
  {
    "format": "clf",
    "message": "127.0.0.1 user-identifier frank [12/Oct/2001:13:55:36 -0700] \"GET /apache_pb.gif HTTP/1.0\" 200 2326",
    "@version": "1",
    "@timestamp": "2001-10-12T20:55:36.000Z",
    "host": "zip",
    "client_ip": "127.0.0.1",
    "@clf": {
      "user": "user-identifier",
      "group": "frank",
      "timestamp": "12/Oct/2001:13:55:36 -0700",
      "request": "GET /apache_pb.gif HTTP/1.0",
      "response": "200",
      "bytes": "2326"
    }
  }
]
```
