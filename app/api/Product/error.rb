module Product
  class Error
    class InvalidRequest < StandardError
    end

    class InvalidProduct < StandardError
    end
  end
end
