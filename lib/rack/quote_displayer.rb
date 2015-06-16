class QuoteDisplayer
  attr_reader :quotes

  def initialize(application)
    @app = application
    @quotes= IO.readlines('./spec/fixtures/rickygervais.txt').each { |line| line.chomp }
  end

  def call(env)
    request = Rack::Request.new(env)
    if request.env['PATH_INFO']== "/quote"
      [200, {"Content-Type" => "text/plain"},"#{@quotes.sample}" ]
    else
      @app.call(env)
    end
  end
end
