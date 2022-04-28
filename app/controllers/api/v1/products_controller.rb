module Api
  module V1
    class ProductsController < ActionController::Base
      def product
        response = Product::Client.product(params[:id])
        render json: response.response
      end
    end
  end
end
