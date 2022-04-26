module Product
  class Client
    def self.product(product_id)
      Request.call(http_method: 'get', endpoint: "/#{product_id}")
    end
  end
end
