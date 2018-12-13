require 'rails_helper'
  describe "Userモデルへの操作" do
    context "パラメータ不足の場合" do
      let!(:args) { Hash.new }
      it 'ユーザ登録に失敗する' do
        puts args
        args[:nickname] = 'Bob'
        args[:birthday] = '2010/01/01'
        args[:password] = 'xxxxx'
        args[:status] = 10
        # args[:cls] = 10
        puts args
        user = User.new(args)
        expect(user.valid?).to eq false
      end
    end
    context "入力条件を満たしている場合" do
      let!(:args) { Hash.new }
      it 'ユーザ登録に成功する' do
        args[:nickname] = 'Bob'
        args[:email] = 'Bob@rsp.ec'
        args[:birthday] = '2010/01/01'
        args[:password] = 'xxxxx'
        args[:status] = 10
        args[:cls] = 10
        user = User.new(args)
        puts user.id, user.email, user.nickname
        user2 = User.new(args)
        users = User.all
        puts users
        expect(user.valid?).to eq true
      end
    end
  end
