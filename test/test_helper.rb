require 'rubygems'
require 'test/unit'
require 'context'
require 'matchy'
require 'rr'

$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'reputation'

class Test::Unit::TestCase
  include RR::Adapters::TestUnit
end
