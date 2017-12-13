require 'yaml'
extracted_yaml = YAML.load_file('sample_yaml.yml')
puts extracted_yaml

def empty_hash_values(h)
  h.each_with_object({}) do |(k,v),g|
    g[k] = (Hash === v) ?  empty_hash_values(v) : nil 
  end
end

yaml_without_values = empty_hash_values(extracted_yaml)

File.open('sample_yaml_without_actual_values.yml','w') do |f|
	f.puts yaml_without_values.to_yaml
end
