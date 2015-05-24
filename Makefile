
inputs=$(wildcard inputs/*.json)
result=$(addsuffix .result,$(inputs))
logs=$(addsuffix .log,$(inputs))

all : parse verify doc

clean:
	${RM} $(result) $(logs)

parse: $(result)

verify: parse $(wildcard tests/*_spec.rb)
	~/.gem/ruby/2.2.0/bin/rspec --color tests/

doc: parse gen_doc.rb
	ruby gen_doc.rb > doc.md

inputs/%.json.result: inputs/%.json  $(wildcard rules/*)
	${RM} $@ $(addsuffix .log,$<)
	/opt/logstash/bin/logstash agent -e "\
	input{ stdin { codec=>\"json\"} }\
	output{ file {\
		codec => \"json_lines\"\
	  path => \"$@\"\
		flush_interval => 0\
	}}" -f rules/ -l $(addsuffix .log,$<) <$<
