require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "モデルへの操作" do
    context "パラメータ不足の場合" do
      pending "TODO:パスワード認証の内部属性:password_digest エラーを解消する。"
    #   begin
    #     let!(:user) { User.new(nickname:'Bob', password:'xxxxx', status: 10) }
    #   rescue NoMethodError => e
    #     puts e.message
    #   end
    #   it '入力値検証に失敗する' do
    #     expect(user.valid?).to eq false
    #   end
    # end
    # context "パラメータ条件を満たしている場合" do
    #   begin
    #     let!(:user) {
    #       User.create({
    #         nickname: 'Bob',email: 'Bob@rsp.ec',birthday: '2010/01/01',
    #         password: 'xxxxx', password_confirmation: 'xxxxx', status: 10
    #       })
    #     }
    #   rescue => exception
    #     puts exception.message
    #   end
    #   it '登録に成功する' do
    #     expect(user.valid?).to eq true
    #   end
    end
  end
end
