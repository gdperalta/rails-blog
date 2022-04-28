module Product
  class Client
    attr_reader :title, :image, :response

    def initialize(response)
      @response = response
      @title = response[:data]['title']
      @image = response[:data]['image']
    end

    def self.product(product_id)
      response = Request.call(endpoint: "/#{product_id}")
      new(response)
    end
  end
end
