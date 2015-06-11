class QuoteDisplayer
  attr_reader :quotes

  def initialize(app)
    @app = app #rails application
    @quotes= IO.readlines('lib/fixtures/rickygervais.txt').each { |line| line.chomp }
  end

  def call(env) #environment hash
    req = Request.new(env)
    if req.GET["quote"] == "random"
      [200, {"Content-Type" => "text/html"}, "\"#{@quotes.sample}\""]
    else
      raise "Invalid params"
      [200, {"Content-Type" => "text/html"}, "\"#{@quotes.sample}\""]
    end
    puts "<a href='?quote=random'>Load Another</a></p>"
  end
end


if $0 == __FILE__
  require 'rack'
  Rack::Handler::WEBrick.run QuoteDisplayer.new
end