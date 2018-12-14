module Api
  module V1
    class TempHumidityController < ApplicationController
      # サンプルのため、トークン認証無効化
      skip_before_action :verify_authenticity_token

      def index
        render json: { status: 'SUCCESS', message: 'index'}, status: :ok
      end

      def create
        render json: { status: 'SUCCESS', message: 'temp_humi_create'}, status: :ok
      end

      private

      def post_params
        params.require(:post).permit(:title)
      end
    end
  end
end
