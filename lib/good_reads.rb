require 'good_reads/version'
require 'good_reads/request'
require 'good_reads/auth'

module GoodReads
  extend self

  include GoodReads::Request
  include GoodReads::Auth

  attr_accessor :options
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
  # options[:oauth_token]
  #
  def self.configure(params = {})
    self.options[:api_key] = params[:api_key]
    self.options[:api_secret] = params[:api_secret]
    self.options[:oauth_token] = params[:oauth_token]
    self.options
  end

  # Add the OAuth token to the GoodReads object
  #
  # oauth_token
  #
  def self.oauth_token(oauth_token)
    self.options[:oauth_token] = oauth_token
    self.options[:oauth_token]
  end

  def self.configuration
    options
  end
end
