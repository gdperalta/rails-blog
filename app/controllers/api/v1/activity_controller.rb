module Api
  module V1
    class ActivityController < ActionController::Base
      def random_activity
        response = ActivityGenerator::Client.randomize
        render json: response.response
      end

      def activity_type
        response = ActivityGenerator::Client.type(params[:type])
        render json: response.response
      end
    end
  end
end
