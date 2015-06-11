class QuoteDisplayer
  attr_reader :quotes

  def initialize(application)
    @app = application
    @quotes= IO.readlines('./spec/fixtures/rickygervais.txt').each { |line| line.chomp }
  end

  def call(env) #environment hash
    req = Rack::Request.new(env)
    if req.GET["quote"] == "random"
      res = Rack::Response.new
      res.write [200, {"Content-Type" => "text/plain"}, "\"#{@quotes.sample}\""]
      #res.write "#{@quotes.sample}"
      res.finish
    else
      [200, {"Content-Type" => "text/plain"}, "\"#{@quotes.sample}\""]
      res = Rack::Response.new
      res.write "#{@quotes.sample}"
      res.finish
    end
  end
end
