module Api
  module V1
    class UserController < ApplicationController
      # サンプルのため、トークン認証無効化
      skip_before_action :verify_authenticity_token

      def index
        render json: { status: 'SUCCESS', message: 'index'}, status: :ok
      end

      def show
        render json: { status: 'SUCCESS', message: 'show'}, status: :ok
      end

      def create
        render json: { status: 'SUCCESS', message: 'create'}, status: :ok
      end

      def destroy
        render json: { status: 'SUCCESS', message: 'destory'}, status: :ok
      end

      def update
        render json: { status: 'SUCCESS', message: 'update'}, status: :ok
      end

      def login
        render json: { status: 'SUCCESS', message: 'login'}, status: :ok
      end

      def logout
        render json: { status: 'SUCCESS', message: 'logout'}, status: :ok
      end
      private

      def post_params
        params.require(:post).permit(:title)
      end
    end
  end
end
