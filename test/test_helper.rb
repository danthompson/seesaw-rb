require 'rubygems'
require 'bundler'
Bundler.require :test

require 'minitest/autorun'
require 'seesaw'

# Support files
Dir["#{File.expand_path(File.dirname(__FILE__))}/support/*.rb"].each do |file|
  require file
end

# VCR
VCR.configure do |c|
  c.cassette_library_dir = 'test/cassettes'
  c.hook_into :webmock
end

class Seesaw::TestCase < MiniTest::Unit::TestCase
  include ::ClientMacros
end
