require "rack"
require "rspec"
require 'spec_helper'
require 'rack/test'
require 'rack/request'
require 'rack/response'
require 'rack/quote_displayer'

class QuoterApp
  def call(env)
    @env = env
    @request = Rack::Request.new(env)
    [200, { 'Content-Type' => 'text/html' }, ['This is a test quote.']]
  end
end
