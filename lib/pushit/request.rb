module Pushit
  class Request
    require 'net/http'

    def initialize(type, url)
      @type                 = type
      @url                  = url
      @head                 = {}
      @head['Content-Type'] = 'application/json'
    end

    def post(body)
      response = Net::HTTP.post_form(@url, body)

      handle_response(response.code.to_i, response.body)
    end

    private

    def handle_response(status_code, body)
      case status_code
      when 200
        return symbolize_first_level(MultiJson.decode(body))
      when 202
        return true
      when 400
        raise Error, "Bad request: #{body}"
      when 401
        raise AuthenticationError, body
      when 404
        raise Error, "404 Not found (#{@url.path})"
      else
        raise Error, "Unknown error (status code #{status_code}): #{body}"
      end
    end

    def symbolize_first_level(hash)
      hash.inject({}) do |result, (key, value)|
        result[key.to_sym] = value
        result
      end
    end
  end
end
