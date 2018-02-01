require "rest-client"

module GoodReads
  module Request
    API_URL = "https://www.goodreads.com"

    protected

    def request(method, params = {})
      response = RestClient.get(API_URL + "/api" + method, params)
    end
  end
end
