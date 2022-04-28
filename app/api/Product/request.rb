require 'httparty'

module Product
  class Request
    include HTTParty
    base_uri 'https://fakestoreapi.com/products'

    def self.call(endpoint:)
      response = get(
        endpoint,
        headers: { 'Content-Type' => 'application/json' }
      )
      handle_errors(response, endpoint)

      { code: response.code, status: 'Success', data: response }
    rescue Error::InvalidRequest => e
      { code: 404, status: 'Invalid Request', data: e.message }
    rescue Error::InvalidProduct => e
      { code: 404, status: 'Invalid Product', data: e.message }
    end

    def self.handle_errors(response, endpoint)
      raise Error::InvalidRequest, "Cannot GET endpoint: '#{endpoint}'" unless response.success?
      raise Error::InvalidProduct, 'Product does not exist' if response.body == 'null'
    end
  end
end
