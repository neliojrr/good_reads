require 'spec_helper'

RSpec.describe GoodReads do
  it "has a version number" do
    expect(GoodReads::VERSION).not_to be nil
  end

  describe "new" do
    it "returns a new GoodReads instance" do
      expect(GoodReads.new).to be_a(GoodReads)
    end
  end

  describe "configure" do
    it "set the hash options of the GoodReads" do
      good = GoodReads.new
      config = good.configure({ api_key: "KEY", api_secret: "SECRET" })
      expect(config).to be_a(Hash)
      expect(config).to have_key(:api_key)
      expect(config).to have_key(:api_secret)
      expect(config[:api_key]).to eql("KEY")
      expect(config[:api_secret]).to eql("SECRET")
    end
  end

  describe "oauth_token" do
    it "set the oauth token at the options of the GoodReads" do
      good = GoodReads.new
      config = good.configuration
      oauth_token = good.oauth_token("OAUTH_TOKEN")
      expect(config).to be_a(Hash)
      expect(config).to have_key(:oauth_token)
      expect(config[:oauth_token]).to eql("OAUTH_TOKEN")
      expect(oauth_token).to eql("OAUTH_TOKEN")
    end
  end

  describe "configuration" do
    it "just prints the options property from GoodReads" do
      good = GoodReads.new({ api_key: "KEY", api_secret: "SECRET" })
      config = good.configuration
      expect(config).to be_a(Hash)
      expect(config).to have_key(:api_key)
      expect(config).to have_key(:api_secret)
      expect(config[:api_key]).to eql("KEY")
      expect(config[:api_secret]).to eql("SECRET")
    end
  end
end
