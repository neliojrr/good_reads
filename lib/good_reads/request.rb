require 'rest-client'
require 'xmlsimple'

module GoodReads
  module Request
    API_URL = "https://www.goodreads.com/api"

    protected

    def request(method, params = {})
      params.merge!(format: "xml", key: GoodReads.configuration[:api_key])

      puts params
      response = RestClient.get(API_URL + method, params) do
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

    def oauth_request(method, params = {})
      oauth_token = GoodReads.configuration[:oauth_token]
      fail "OAuth access token required!" unless oauth_token

      if params
        url_params = params.map { |k, v| "#{k}=#{v}" }.join("&")
        path = "#{API_URL + method}?#{url_params}"
      end
      resp = oauth_token.get(path, "Accept" => "application/xml")

      case resp
      when Net::HTTPUnauthorized
        fail(GoodReads::Unauthorized)
      when Net::HTTPNotFound
        fail (GoodReads::NotFound)
      end

      parse(resp)
    end

    def parse(resp)
      hash = XmlSimple.xml_in(resp.body)
      hash.delete("Request")
      hash
    end
  end
end
