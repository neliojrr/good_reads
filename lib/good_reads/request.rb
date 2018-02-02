require 'rest-client'

module GoodReads
  module Request
    API_URL = "https://www.goodreads.com"

    protected

    def request(method, params = {})
      params.merge!(format: "xml", key: GoodReads.configuration[:api_key])

      puts params
      response = RestClient.get(API_URL + "/api" + method, params) do
        |response, request, result, &block|
        case response.code
        when 200
          response.return!(&block)
        when 401
          puts "here"
          fail(GoodReads::Unauthorized)
        when 403
          fail(GoodReads::Forbidden)
        when 404
          fail(GoodReads::NotFound)
        end
      end

      parse(response)
    end

    def parse(resp)
      hash = Hash.from_xml(resp.body)["GoodreadsResponse"]
      hash.delete("Request")
      hash
    end
  end
end
