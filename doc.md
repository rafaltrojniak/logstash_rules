Formats
-------

### XML Multiline parsing

#### Event metadaa

#### Fields :
* `message`
  * Description : Joined XML
  * type: string
  * example values:
    * `"<response>\n  <statusCode>200</statusCode>\n  <data>\n      <testId>150603_VD_9VJ</testId>\n      <average>\n         <loadTime>3594</loadTime>\n         <TTFB>282</TTFB>\n     </average>\n </data>\n</response>"`
    * `"<response>\n  <statusCode>300</statusCode>\n  <data>\n      <testId>999999_VD_9VJ</testId>\n      <average>\n         <loadTime>4594</loadTime>\n         <TTFB>900</TTFB>\n     </average>\n </data>\n</response>"`
* `data`
  * Description : Data extracted from XML
  * type: object
  * example values:
    * `{"statusCode"=>["200"], "data"=>[{"testId"=>["150603_VD_9VJ"], "average"=>[{"loadTime"=>["3594"], "TTFB"=>["282"]}]}]}`
    * `{"statusCode"=>["300"], "data"=>[{"testId"=>["999999_VD_9VJ"], "average"=>[{"loadTime"=>["4594"], "TTFB"=>["900"]}]}]}`

#### Example sources
Source:
```json
[
  {
    "message": "<?xml version=\"1.0\" encoding=\"UTF-8\"/>"
  },
  {
    "message": "<response>"
  },
  {
    "message": "  <statusCode>200</statusCode>"
  },
  {
    "message": "  <data>"
  },
  {
    "message": "      <testId>150603_VD_9VJ</testId>"
  },
  {
    "message": "      <average>"
  },
  {
    "message": "         <loadTime>3594</loadTime>"
  },
  {
    "message": "         <TTFB>282</TTFB>"
  },
  {
    "message": "     </average>"
  },
  {
    "message": " </data>"
  },
  {
    "message": "</response>"
  },
  {
    "message": "<response>"
  },
  {
    "message": "  <statusCode>300</statusCode>"
  },
  {
    "message": "  <data>"
  },
  {
    "message": "      <testId>999999_VD_9VJ</testId>"
  },
  {
    "message": "      <average>"
  },
  {
    "message": "         <loadTime>4594</loadTime>"
  },
  {
    "message": "         <TTFB>900</TTFB>"
  },
  {
    "message": "     </average>"
  },
  {
    "message": " </data>"
  },
  {
    "message": "</response>"
  }
]
```
Result:
```json
[
  {
    "message": "<response>\n  <statusCode>200</statusCode>\n  <data>\n      <testId>150603_VD_9VJ</testId>\n      <average>\n         <loadTime>3594</loadTime>\n         <TTFB>282</TTFB>\n     </average>\n </data>\n</response>",
    "@version": "1",
    "@timestamp": "2015-06-05T11:42:40.448Z",
    "host": "zip",
    "tags": [
      "multiline"
    ],
    "data": {
      "statusCode": [
        "200"
      ],
      "data": [
        {
          "testId": [
            "150603_VD_9VJ"
          ],
          "average": [
            {
              "loadTime": [
                "3594"
              ],
              "TTFB": [
                "282"
              ]
            }
          ]
        }
      ]
    }
  },
  {
    "message": "<response>\n  <statusCode>300</statusCode>\n  <data>\n      <testId>999999_VD_9VJ</testId>\n      <average>\n         <loadTime>4594</loadTime>\n         <TTFB>900</TTFB>\n     </average>\n </data>\n</response>",
    "@version": "1",
    "@timestamp": "2015-06-05T11:42:40.456Z",
    "host": "zip",
    "tags": [
      "multiline"
    ],
    "data": {
      "statusCode": [
        "300"
      ],
      "data": [
        {
          "testId": [
            "999999_VD_9VJ"
          ],
          "average": [
            {
              "loadTime": [
                "4594"
              ],
              "TTFB": [
                "900"
              ]
            }
          ]
        }
      ]
    }
  }
]
```
