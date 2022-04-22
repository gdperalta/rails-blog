module QuoteRandomizer
  class Client
    def self.randomize
      response = Request.call(http_method: 'get', endpoint: '/random.json')
    end
  end
end
