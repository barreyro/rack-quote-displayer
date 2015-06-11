require 'rack'

class QuoteDisplayer
  attr_reader :quotes

  def initialize(application)
    @app = application
    @quotes= IO.readlines('./spec/fixtures/rickygervais.txt').each { |line| line.chomp }
  end

  def call(env) #environment hash
    req = Rack::Request.new(env)
    if req.GET["quote"] == "random"
      [200, {"Content-Type" => "text/html"}, "\"#{@quotes.sample}\""]
    else
      [200, {"Content-Type" => "text/html"}, "\"#{@quotes.sample}\""]
    end

    res = Rack::Response.new
    res.write "<title>Random Ricky Quotes</title>"
    res.write "<p><a href='?quote=random'>Load Another</a></p>"
    res.finish
  end
end


if $0 == __FILE__
  require 'rack'
  Rack::Handler::WEBrick.run QuoteDisplayer.new
end
