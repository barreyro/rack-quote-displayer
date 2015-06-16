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

  describe "at GET request" do
    let(:request) { Rack::MockRequest.new(app) }
    let(:response)  { request.get('/quote') }
    let(:response2) { request.get('/quote') }
    let(:invalid_param) { request.get('/GSW4LYF') }

    context "with valid params" do
      it "support sending params" do
        expect{response}.to_not raise_error
      end

      it "do not follow redirects" do
        get ("/quote")
        expect(last_request.env['PATH_INFO']).to eq('/quote')
      end

      it "is valid with a valid params" do
        expect(response.body).to be_truthy
      end

      it "returns a quote" do
        expect(app.quotes).to include(response.body)
      end

      it "returns a response as text/plain" do
        expect(response['Content-Type']).to eq('text/plain')
      end

      it "returns a single quote" do
        expect{(response.body).to match(/\w+.?\/n$/)}
      end

      it "returns a random quote" do
        expect(response.body).not_to eq(response2.body)
      end
    end

    context "with invalid params" do
      it "doesn't return an error" do
        expect{invalid_param}.to_not raise_error
      end

      it "doesn't return a quote" do
        expect(app.quotes).to_not include(invalid_param.body)
      end

      it "doesnt change the params" do
        get ("/GSW4LYF")
        expect(last_request.env['PATH_INFO']).to eq('/GSW4LYF')
      end

      it "ignores middleware" do
        expect(invalid_param.body).to eq "Reach new app"
      end
    end
  end
end