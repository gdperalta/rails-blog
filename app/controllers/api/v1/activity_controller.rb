module Api
  module V1
    class ActivityController < ActionController::Base
      def random_activity
        render json: ActivityGenerator::Client.randomize
      end

      def activity_type
        render json: ActivityGenerator::Client.type(params[:type])
      end
    end
  end
end
