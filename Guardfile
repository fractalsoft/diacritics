guard 'bundler' do
  watch('Gemfile')
  watch(/^.+\.gemspec/)
end

guard :rspec do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$}) do |array|
    name = array.last
    "spec/#{name}_spec.rb"
  end
  watch('spec/spec_helper.rb')  { "spec" }
end
