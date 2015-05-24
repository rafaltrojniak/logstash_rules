require 'json'

def grab_logs(name)
	return open("inputs/#{name}.json.log").to_a
end
def grab_source(name)
	return File.open("inputs/#{name}.json").to_a
	  .map{|line| JSON.parse(line) }
end
def grab_results(name)
	return File.open("inputs/#{name}.json.result").to_a
	  .map{|line| JSON.parse(line) }
end
