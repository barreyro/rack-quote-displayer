require 'spec_helper'

describe "QuoteDisplayer" do
  include Rack::Test::Methods

  let(:quoteapp) { QuoterApp.new }
  let(:app) { QuoteDisplayer.new(quoteapp) }

  context "when initialized" do
    it "reads quotes from fixtures directory" do
      expect(File.read("./spec/fixtures/rickygervais.txt")).to include "Piracy doesn't kill music, boy bands do."
    end

    it "supports being initalized with a mock session" do
      expect(Rack::MockRequest.new(app)).to be_truthy
    end

    it "supports being initialized with an app" do
      session = QuoteDisplayer.new(app)
      expect(session).to be_truthy
    end

    it "raises ArgumentError when no parameters passed" do
      expect{ QuoteDisplayer.new }.to raise_error(ArgumentError)
    end
  end

  describe "at GET request," do
    let(:request) { Rack::MockRequest.new(app) }
    let(:response)  { request.get('/quote') }
    let(:response2) { request.get('/quote') }
    let(:invalid_param) { request.get('/GSW4LYF') }

    context "valid params" do
      it "supports sending params" do
        expect{response}.to_not raise_error
      end

      it "do not follow redirects" do
        get ("/quote")
        expect(last_request.env['PATH_INFO']).to eq('/quote')
      end

      it "are valid" do
        expect(response.body).to be_truthy
      end

      it "return a quote" do
        expect(app.quotes).to include(response.body)
      end

      it "return a response as text/plain" do
        expect(response['Content-Type']).to eq('text/plain')
      end

      it "return a single quote" do
        middleware = QuoteDisplayer.new(quoteapp)
        allow(middleware).to receive(:get_quotes) {['my fake quote']}
        req = Rack::MockRequest.new(middleware)
        expect(req.get("/quote").body).to match('my fake quote')
      end

      it "return a random quote" do
        expect(response.body).not_to eq(response2.body)
      end
    end

    context "invalid params" do
      it "doesn't return an error" do
        expect{invalid_param}.to_not raise_error
      end

      it "do not return a Ricky quote" do
        expect(app.quotes).to_not include(invalid_param.body)
      end

      it "do not change the params" do
        get ("/GSW4LYF")
        expect(last_request.env['PATH_INFO']).to eq('/GSW4LYF')
      end

      it "ignore middleware" do
        expect(invalid_param.body).to eq "Reach new app"
      end
    end
  end
end
