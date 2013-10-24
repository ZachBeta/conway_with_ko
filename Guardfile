# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :rspec do
  watch(%r{^spec/.+_spec\.rb$})
  # spec/conway_spec.rb
  watch(%r{^(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  # conway.rb
  # spec/conway_spec.rb
end

