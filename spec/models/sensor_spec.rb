require 'rails_helper'
require 'providers/data'

  # describe "Sensorモデル" do
RSpec.describe Sensor, :type => :model do
  describe "モデル" do
    user = Providers::Data.new_user()
    context "パラメータ不足の場合" do
      let(:sensor) { Sensor.new(
        user_id: user.id,
        explanation: "-20 - 80度まで計測可能。",
      )}
      it '入力値検証に失敗する' do
        expect(sensor.valid?).to eq false
      end
    end
    context "パラメータ条件を満たしている場合" do
      let!(:sensor) { Sensor.create(
        user_id: user.id,
        name: "センサー1",
        explanation: "-20 - 80度まで計測可能。",
      )}
      it '登録に成功する' do
        expect(sensor.valid?).to eq true
      end
    end
  end
end
