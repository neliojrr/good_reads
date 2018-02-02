require 'good_reads/version'
require 'good_reads/request'
require 'good_reads/auth'

module GoodReads
  class << self
    include GoodReads::Request
    include GoodReads::Auth

    attr_accessor :options
  end
  self.options = {}

  def self.new(params = {})
    self.options[:api_key] = params[:api_key]
    self.options[:api_secret] = params[:api_secret]
    self
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
