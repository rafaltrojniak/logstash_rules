Formats
-------

### Common Log Format

#### Fields :
* @clf.method
  * Description : HTTP Request method
  * type: string
  * example values:
    * type: "GET"
    * type: "POST"
    * type: "HEAD"
* @clf.method
  * Description : HTTP authorized user
  * type: string
  * example values:
    * type: "john"
    * type: nil
* group
  * Description : HTTP authorized group
* request
  * Description : HTTP request line
  * type: string
  * example values:
    * type: "GET / HTTP/1.1"

#### Example sources
Source:
```json
[
  {
    "format": "clf",
    "message": "127.0.0.1 user-identifier frank [10/Oct/2000:13:55:36 -0700] \"GET /apache_pb.gif HTTP/1.0\" 200 2326"
  }
]
```
Result:
```json
[
  {
    "format": "clf",
    "message": "127.0.0.1 user-identifier frank [10/Oct/2000:13:55:36 -0700] \"GET /apache_pb.gif HTTP/1.0\" 200 2326",
    "@version": "1",
    "@timestamp": "2015-05-24T20:22:59.844Z",
    "host": "zip",
    "client_ip": "127.0.0.1",
    "user": "user-identifier",
    "group": "frank",
    "apache_timestamp": "10/Oct/2000:13:55:36 -0700",
    "request": "GET /apache_pb.gif HTTP/1.0",
    "server_response": "200",
    "bytes": "2326"
  }
]
```
