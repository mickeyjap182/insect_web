module Api
  module V1
    class TempHumidityController < ApplicationController
      # TODO:トークン認証・同一生成元ポリシー有効化
      skip_before_action :verify_authenticity_token

      def index
        tempHumidities = TempHumidity.order(id: :desc).limit(50).offset(0).select("id", "temp", "humidity", "inspected_at")
        render json: { status: 'SUCCESS', message: 'index', tempHumidities: tempHumidities}, status: 200
      end

      def create
        begin
          logger.debug params
          req = post_params
          # TODO: requestのバリデータ、例外ブロックを基底 or  or concernsへ
          [ :sensor_id, :temp, :humidity, :inspected_at ].each do |param|
            logger.debug param
            raise("パラメータに不足があります。") if !req.key?(param)
          end

          tempHumidity = TempHumidity.new(
            sensor_id:    req["sensor_id"],
            temp:         req["temp"],
            humidity:     req["humidity"],
            inspected_at: req["inspected_at"]
          )
          raise("入力値に誤りがあります。")  if !(tempHumidity.valid?)
          tempHumidity.save!()
          return render json: { status: :SUCCESS, message: '登録が完了しました。'}, status: 200
        rescue => exception
          # TODO:ログ出力へ移動
          logger.debug exception.message
          logger.debug exception.backtrace
          return render json: { status: :FAILURE, message: exception.message }, status: 400
        end
      end

      private

      def post_params
        return JSON.parse(request.body.read)
      end
    end
  end
end
