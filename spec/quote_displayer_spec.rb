require 'rack/quote_displayer'

describe "QuoteDisplayer" do

  context "when initialized" do
    it "retrieves quotes from fixtures directory"
    it "retrieves one line from the file"
    it "supports being initalized with a mock session"
    it "supports being initialized with an app"
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