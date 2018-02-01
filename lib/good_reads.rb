require "good_reads/version"

module GoodReads
  self.options = {}

  def self.new(params = {})
    true
  end

  # Define a global configuration
  #
  # options[:api_key]
  # options[:api_secret]
  def self.configure(params = {})
    options[:api_key] = params[:api_key]
    options[:api_secret] = params[:api_secret]
    options
  end

  def self.configuration
    options
  end
end
