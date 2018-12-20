require 'rails_helper'
require 'providers/requests'

RSpec.describe 'Users', :type => :request do
  begin
    # user = Providers::Data.new_user()
    req_header = Providers::Requests.header()
  rescue => exception
    puts exception.message
    # puts exception.backtrace
  end
  describe "POST api::v1::user#create" do
    context "パラメータが足りない場合" do
      let!(:data) {
        {
          nickname: "succeed_to_create",
          password: "password",
        }.to_json
      }
      it '入力エラーとなる ' do
        post  api_v1_user_create_path,  :params =>data, :headers => req_header # ,req_header
        json = JSON.parse(response.body)

        expect(json['status']).to eq 'FAILURE'
        expect(json['message']).to eq '入力値に誤りがあります。'
        # expect(json.key?('token')).to eq true # TODO:apikey実装後
      end
    end
    context "確認パスワードが間違っている場合" do
      let(:data) {
        {
          nickname: "succeed_to_create",
          password: "password",
          password_confirm: "incorrect_password"
        }.to_json
      }
      it 'パスワード入力エラーとなる ' do
        post  api_v1_user_create_path,  :params =>data, :headers => req_header # ,req_header
        json = JSON.parse(response.body)

        expect(json['status']).to eq 'FAILURE'
        expect(json['message']).to eq 'パスワードは両方同じ内容を指定してください。'
      end
    end
  end
end
