
inputs=$(wildcard inputs/*.json)
result=$(addsuffix .result,$(inputs))
logs=$(addsuffix .log,$(inputs))

rspec=.gem/bin/rspec
logstash=/opt/logstash/bin/logstash

all : parse verify doc

clean:
	${RM} $(result) $(logs) doc.md

parse: $(result)

verify: $(rspec) parse $(wildcard tests/*_spec.rb)
	GEM_HOME=.gem/ $(rspec) --color tests/

$(rspec):
	gem install rspec -i .gem/ --no-user-install

doc: parse gen_doc.rb
	ruby gen_doc.rb > doc.md

inputs/%.json.result: inputs/%.json  $(wildcard rules/*)
	${RM} $@ $(addsuffix .log,$<)
	$(logstash) agent -e "\
	input{ stdin { codec=>\"json\"} }\
	output{ file {\
		codec => \"json_lines\"\
	  path => \"$@\"\
		flush_interval => 0\
	}}" -f rules/ -l $(addsuffix .log,$<) <$<
