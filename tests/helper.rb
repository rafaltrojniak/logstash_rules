require 'json'

def grab_logs(path)
	return open("#{path}.log").to_a
end
def grab_source(path)
	return File.open(path).to_a
	  .map{|line| JSON.parse(line) }
end
def grab_results(path)
	return File.open("#{path}.result").to_a
	  .map{|line| JSON.parse(line) }
end
