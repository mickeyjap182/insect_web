require 'rails_helper'
require 'providers/data'

RSpec.describe TempHumidity, :type => :model do
  describe "モデル" do
    # TODO: モデル内部エラーの解決
    # user   = Providers::Data.new_user()
    # sensor = Providers::Data.new_sensor(user)
    context "パラメータ不足の場合" do
      let(:th) { TempHumidity.new(
        humidity: 67.8,
      )}
      it '入力値検証に失敗する' do
        expect(th.valid?).to eq false
      end
    end
    context "パラメータ条件を満たしている場合" do
      pending "TODO: solve UnknownAttributeError."
    #   let!(:args) { Hash.new }
    #   it '登録に成功する' do
    #     user = Providers::Data.new_user()
    #     sensor = Providers::Data.new_sensor(user)
    #     th = TempHumidity.create(
    #       sensor_id: sensor.id,
    #       temp: 15.2,
    #       humidity: 67.8,
    #       # inspected_at: '2012/01/11',
    #     )
    #     expect(th.valid?).to eq true
      # end
    end
  end
end
