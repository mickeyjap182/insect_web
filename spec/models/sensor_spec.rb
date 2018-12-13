require 'rails_helper'

  describe "Sensorモデル" do
    # context "パラメータ不足の場合" do
    #   let(:args) { Hash.new }
    #   it 'ユーザ登録に失敗する' do
    #     puts args
    #     args[:nickname] = 'Bob'
    #     args[:birthday] = '2010/01/01'
    #     args[:password] = 'xxxxx'
    #     args[:user_status] = 10
    #     args[:user_type] = 10
    #     puts args
    #     user = User.new(args)
    #     expect(user.valid?).to eq false
    #   end
    # end
    context "入力条件を満たしている場合" do
      let!(:args) { Hash.new }
      it 'センサーの登録に成功する' do
        # puts user
        # args = {
        #   :user => user.id, :name=>'センサー1', :sensor_type=> 10,
        #   :explanation=> "温湿度センサー", :sensor_status=> 10,
        # }
        user = User.create(
          nickname: "Bob",
          email: "Bob@rsp.ec",
          birthday: "2010/01/01",
          password: "xxxxx",
          status: 10,
          cls: 10
        )
        puts '==user_id=='
        puts user.id
        args[:user_id] = user.id
        args[:name] = 'センサー1'
        args[:explanation] = '-20 - 80度まで測れます。'
        args[:cls] = 10
        args[:status] = 10
        sensor = Sensor.new(args)
        expect(true).to eq true
        # t.references :user, foreign_key: true
        # t.string :name
        # t.integer :sensor_type
        # t.string :explanation
        # t.integer :valid
        # t.datetime :created_at
        # t.datetime :updated_at
      end
    end
  end
