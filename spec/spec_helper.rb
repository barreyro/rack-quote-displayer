require "rack"
require "rspec"


class QuoterApp
  def call(env)
    @env = env
    [200, {'Content-Type' => 'text/html'}, ['This is a test quote.']]
  end
end