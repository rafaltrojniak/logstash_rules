#!/usr/bin/env ruby
require 'elasticsearch'
require './tests/helper.rb'
require 'pp'

scenario = 'CLF'
examples = %w(CLF CLF_empty other)

# TODO Add and use host address
# host='127.0.0.1'
index_prefix='es_store_test_'
mapping={
  CLF:{
    properties:{
      '@clf' => {
        properties:{
          bytes: {
            type: "long",
            index: 'not_analyzed'
          },
          timestamp: {
            type: "string",
            index: 'no'
          },
          group: {
            type: "string",
            index: 'not_analyzed'
          },
          request: {
            type: "string",
            index: 'no'
          },
          user: {
            type: "string",
            index: 'not_analyzed'
          },
          client_ip: {
            type: "ip"
          }

        }
      }
    }
  }

  } # TODO read mapping

index_name = (index_prefix+scenario).downcase
client = Elasticsearch::Client.new log: false

client.indices.delete index:index_name if client.indices.exists index:index_name

client.indices.create(
  index: index_name ,
  body: {
    mappings: mapping
  }
)

(1..1).to_a.each do |_id|
  examples.each do |example|
    docs = grab_results(example)
    docs.each_with_index do |doc, number|
      type = doc['type']
      id= "#{example}-#{number}"
      type = 'log' if type.nil?
      client.index index: index_name, id:id, type: type, body: doc
    end
  end
end

client.indices.optimize index: index_name
stats=client.indices.stats index: index_name, docs:true, metric:%w(docs, store)
prim_stats=stats['indices'][index_name]['primaries']
docs_count = prim_stats['docs']['count']
docs_size = prim_stats['store']['size_in_bytes']
pp docs: docs_count, size: docs_size, div: docs_size/docs_count

# Count tests
tests = [
# Query - result list
 [{ '@clf.group' => ['frank'] }, [ 'CLF-0'] ],
 [{ '@clf.user' => ['user-identifier']}, [ 'CLF-0'] ],
 [{ '@clf.user' => ['user'] }, []],
 [{ '@clf.client_ip' => ['127.0.0.1'] }, ["CLF-0", "CLF_empty-0"]]
]

tests.each do |(query, expected_list)|
  results = client.search index: index_name , body: { query:{ filtered: { filter: { terms: query } } }}
  result_ids = results['hits']['hits'].map{|event| event['_id']}
  pp(
    query: query,
    passed: expected_list & result_ids,
    missing_entries: expected_list - result_ids,
    unexpected_entries: result_ids - expected_list
  )
  
end
