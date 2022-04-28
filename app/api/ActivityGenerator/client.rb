module ActivityGenerator
  class Client
    attr_reader :activity, :type, :key, :accessibility, :response

    def initialize(response)
      @response = response
      @activity = response[:data]['activity']
      @type = response[:data]['type']
      @key = response[:data]['key']
      @accessibility = response[:data]['accessibility']
    end

    def self.randomize
      response = Request.call(http_method: 'get', endpoint: '/')
      new(response)
    end

    def self.type(type)
      response = Request.call(http_method: 'get', endpoint: "?type=#{type}")
      new(response)
    end
  end
end
