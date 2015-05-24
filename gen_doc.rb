require 'yaml'
require 'erb'
require './tests/helper.rb'

docs=[]
sources={}
results={}

examples=[]

Dir.glob('doc/*.yml').each do |doc_file|
  doc = YAML.load_file(doc_file)
	examples += doc['examples']
	docs << doc
end

examples.each do |example|
  sources[example] = grab_source(example)
  results[example] = grab_results(example)
end

template = File.read('./template.md.erb')

puts ERB.new(template,nil,'<>').result(binding())
