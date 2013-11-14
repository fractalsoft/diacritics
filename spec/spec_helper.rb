# encoding: utf-8
require 'diacritics'
require 'coveralls'
Coveralls.wear!
require 'simplecov'
SimpleCov.start
require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
end
