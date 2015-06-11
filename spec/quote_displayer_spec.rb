require 'rack/quote_displayer'
require 'spec_helper'
require 'rack/test'

describe "QuoteDisplayer" do
  let(:quoteapp) { QuoterApp.new }
  let(:app) { QuoteDisplayer.new(quoteapp) }

  context "when initialized" do
    it "reads quotes from fixtures directory" do
      expect(File.read("./lib/fixtures/rickygervais.txt")).to include "Piracy doesn't kill music, boy bands do."
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
    context "at default" do
      it "defaults to GET"
      it "doesn't redirect by default"
      it "supports sending params"
    end

    context "with valid params" do
      it "is valid with a valid params"
      it "returns a quote as a text format"
      it "returns a single quote"
      it "returns a random quote"
    end

    context "with invalid params" do
      it "raises an error for invalid params"
      it "re-renders the get method"
    end
  end

  describe "at POST" do
    context "with valid params" do
      it "returns a different quote"
      it "is valid with a valid quote"
      it "returns a quote as a text format"
      it "returns a random quote"
    end

    context "with invalid params" do
      it "accepts raw input"
      it "raises an error"
      it "changes params to valid params"
    end
  end

end