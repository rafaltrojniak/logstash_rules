About
-----
This project aims to provide full framework for:
* Development and verification of Logstash processing rules
* Provide regression tests
* Provide documentation about gathered events

TODO:
* Compare that with Elasticsearch mapping files
* Test events against Elasticserach mappings
* Document mapping impact on events stored in Elasticsearch


Details
-------

* Inputs
  * Raw events that are going to be processed by Logstash
  * Logstash rules that will process the events above
  * Documentation about the result event Fields
* Outputs
  * Test results
  * Documentation containing field description and example events
* Processes
  * Tests proper processing of the events
  * Test result events against set of tests (unit-tests for events)
  * Generate documentation based on the field-documentation and processing result


### Process stages
* Grab and process the events using rules
  * Test if logstash successfully parsed the event
  * Test if there were invalid parsed events
* Verify processing results against tests
  * Grab the results
  * Explode the JSONs
  * Match JSON parts against tests
* Generate documentation
  * Grab some resulted events
  * Decorate them
  * Ad description of the fields

### How to use
* First create example input event in JSON format in input/YourFormat.json (put the line in message field)
* With the example message, you can start to write your rules in rules/ directory
* To check if the output is what you expected you can write some Rspec tests in spec/YourFormat_spec.rb file
* At the end you can create some documentation in doc/YourFormat.yml directory

Please see examples to start your work
