require 'rest-client'

module ActivityGenerator
  class Request
    BASE_URL = 'https://www.boredapi.com/api/activity'

    def self.call(http_method:, endpoint:)
      result = RestClient::Request.execute(
        method: http_method,
        url: "#{BASE_URL}#{endpoint}",
        headers: { 'Content-Type' => 'application/json' }
      )
      handle_errors(result)

      { code: result.code, status: 'Success', data: JSON.parse(result) }
    rescue RestClient::ExceptionWithResponse => e
      { code: e.http_code, status: e.message, data: Error.map(e.http_code) }
    rescue Error::InvalidEndpoint => e
      { code: 404, status: 'Invalid Request', data: JSON.parse(e.message)['error'] }
    end

    def self.handle_errors(result)
      raise Error::InvalidEndpoint, result unless result['error'].nil?
    end
  end
end
