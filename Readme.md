About
-----
This project aims to provide full framework for :
* Development and verification of Logstash processing rules
* Provide regression tests
* Provide documentation about gathered events

TODO :
* Compare that with Elasticsearch mapping files
* Test events agains Elasticserach mappings
* Document mapping impact on events stored in Elasticsearch


Details
-------

* Inputs
  * Raw events that are going to be processed by Logstash
  * Logstash rules that will provess the events above
  * Documentation about the result event Fields
* Outputs
  * Test results
  * Documentation containing field description and example events
* Processes
  * Tests proper processing of the events
  * Test result events agains set of tests (A'la unit-tests for events)
  * Generate documentation based on the field-documnetation and processing result


### Process stages :
* Grab and process the events using rules
  * Test if logstash successfully parsed the event
  * Test if there were invalid parsed events
* Verify processing results agains tests
  * Grab the results
  * Explode the jsons
  * Match json parts against tests
* Generate documnetation
  * Grab some resulted events
  * Decurate them
  * Ad description of the fields

