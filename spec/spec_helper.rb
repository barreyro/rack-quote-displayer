require "rack"
require "rspec"
require 'spec_helper'
require 'rack/test'
require 'zlib'
require 'rack/lint'

require 'rack/request'
require 'rack/response'

class QuoterApp
  def call(env)
    @env = env
    @request = Rack::Request.new(env)
    [200, { 'Content-Type' => 'text/html' }, ['This is a test quote.']]
  end
end
