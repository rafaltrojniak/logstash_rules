Formats
-------

### XML_Xpath example

#### Event metadaa

#### Fields :
* `message_parsed`
  * Description : XML contents
  * example values:
    * `{"stats"=>[{"current-online-user-count"=>["1730"], "login-rate"=>["0"], "successful_logins"=>["93645"], "failed_logins"=>["84583"], "uptime"=>["1900999"]}, {"total-message-packets"=>["5428196"], "total-presence-packets"=>["288328380"], "total-iq-packets"=>["4977074"], "messages-in-last-time-slice"=>["0"], "average-message-size"=>["0"]}]}`
* `x_failed_logins`
  * Description : Result of XPath query
  * example values:
    * `["84583"]`

#### Example sources
Source:
```json
[
  {
    "format": "xml_xpath",
    "message": "<stats><stats><current-online-user-count>1730</current-online-user-count><login-rate>0</login-rate><successful_logins>93645</successful_logins><failed_logins>84583</failed_logins><uptime>1900999</uptime></stats>\n<stats><total-message-packets>5428196</total-message-packets><total-presence-packets>288328380</total-presence-packets><total-iq-packets>4977074</total-iq-packets><messages-in-last-time-slice>0</messages-in-last-time-slice><average-message-size>0</average-message-size></stats></stats>"
  }
]
```
Result:
```json
[
  {
    "format": "xml_xpath",
    "message": "<stats><stats><current-online-user-count>1730</current-online-user-count><login-rate>0</login-rate><successful_logins>93645</successful_logins><failed_logins>84583</failed_logins><uptime>1900999</uptime></stats>\n<stats><total-message-packets>5428196</total-message-packets><total-presence-packets>288328380</total-presence-packets><total-iq-packets>4977074</total-iq-packets><messages-in-last-time-slice>0</messages-in-last-time-slice><average-message-size>0</average-message-size></stats></stats>",
    "@version": "1",
    "@timestamp": "2015-05-27T17:31:03.284Z",
    "host": "zip",
    "x_failed_logins": [
      "84583"
    ],
    "message_parsed": {
      "stats": [
        {
          "current-online-user-count": [
            "1730"
          ],
          "login-rate": [
            "0"
          ],
          "successful_logins": [
            "93645"
          ],
          "failed_logins": [
            "84583"
          ],
          "uptime": [
            "1900999"
          ]
        },
        {
          "total-message-packets": [
            "5428196"
          ],
          "total-presence-packets": [
            "288328380"
          ],
          "total-iq-packets": [
            "4977074"
          ],
          "messages-in-last-time-slice": [
            "0"
          ],
          "average-message-size": [
            "0"
          ]
        }
      ]
    },
    "tags": [
      "xml_parsed"
    ]
  }
]
```
