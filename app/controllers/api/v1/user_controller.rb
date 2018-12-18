module Api
  module V1
    class UserController < ApplicationController
      # TODO:トークン認証・同一生成元ポリシー有効化
      skip_before_action :verify_authenticity_token

      def index
        users = User.order(id: :asc).limit(20).offset(0).select("id", "nickname", "email")
        render json: { status: :SUCCESS, message: 'index', users: users}, status: 200
      end

      def show
        render json: { status: :SUCCESS, message: 'show'}, status: :ok
      end

      def create
        puts "==create=="
        puts params
        req = post_params
        puts req
        begin
          raise("入力値に誤りがあります。") if !(req.key?("nickname") && req.key?("password") && req.key?("password_confirm"))
          raise("パスワードは両方同じ内容を指定してください。") if (req["password"] != req["password_confirm"])
          raise("既に登録済みです。")  if User.exists?(nickname: req["nickname"])
          logger.debug("=====create!=====")
          user = User.new(
            nickname: req["nickname"],
            password: req["password"],
            password_confirmation: req["password_confirm"],
            status: User::STATUS_VALID
          )
          raise("入力が有効ではありません。")  if !(user.valid?)
          user.save!()
          render json: { status: :SUCCESS, message: '登録が完了しました。'}, status: 200
        rescue => exception
          # ログ出力へ移動
          logger.debug exception.message
          logger.debug exception.backtrace
          render json: { status: :FAILURE, message: exception.message}, status: 400
        end

      end

      def destroy
        render json: { status: 'SUCCESS', message: 'destory'}, status: :ok
      end

      def update
        render json: { status: 'SUCCESS', message: 'update'}, status: :ok
      end

      def login
        puts '==request body=='
        req = post_params
        puts req
        # puts JSON.parse(request.body.read)
        render json: { status: 'SUCCESS', message: 'login', token: 'tokenstring'}, status: :ok
      end

      def logout
        render json: { status: 'SUCCESS', message: 'logout'}, status: :ok
      end
      private

      def post_params
        # params.require(:post).permit(:nickname, :password, :password_confirm)
        JSON.parse(request.body.read)
      end
    end
  end
end
