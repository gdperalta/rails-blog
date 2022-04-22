require 'rest-client'

module QuoteRandomizer
  class Request
    BASE_URL = 'https://uselessfacts.jsph.pl'

    def self.call(http_method:, endpoint:)
      result = RestClient::Request.execute(
        method: http_method,
        url: "#{BASE_URL}#{endpoint}",
        headers: { 'Content-Type' => 'application/json' }
      )
      JSON.parse(result)
    end
  end
end
