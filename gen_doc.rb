require 'yaml'
require 'erb'
require './tests/helper.rb'

docs=[]
sources={}
results={}

examples=[]

# Let's graph all documentation files
Dir.glob('doc/*.yml').each do |doc_file|
  doc = YAML.load_file(doc_file)
  # Here we will cumulate examples list
  examples += doc['examples']
  docs << doc
end

# Lets build global examples lists
examples.uniq.each do |example|
  sources[example] = grab_source(example)
  results[example] = grab_results(example)
end

# Let's populate values on the fields without them
docs.each do |doc|
  next if doc['examples'].nil?
  doc['fields'].each do |fname, fvals|
    next unless fvals['values'].nil?
    # Field without example values
    # First, let's create path to the field
    field_path = (fvals['path']||fname).split('.').reverse
    values=[]
    doc['examples'].each do |example|
      results[example].each do |ex_event|
        # Dig to the event value
        value = ex_event
        it = field_path.dup
        while it.size >0
          break unless value.is_a?(Hash)
          break unless value.key?(it.last)
          value=value[it.pop]
        end
        if it.size == 0
          values<<value
        end
      end
    end
    fvals['values'] = values.uniq
  end #field
end # doc

template = File.read('./template.md.erb')
puts ERB.new(template,nil,'<>').result(binding())
