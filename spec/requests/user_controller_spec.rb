require 'rails_helper'
require 'providers/requests'

RSpec.describe 'Users', :type => :request do
  begin
    user = Providers::Data.new_user()
    req_header = Providers::Requests.header()
  rescue => exception
    puts exception.message
    # puts exception.backtrace
  end
  describe "POST api::v1::user#login" do
    it 'ログインに成功 ' do
      req_body = {
          nickname: "garga",
          password: "agaga"
          # headers: { 'X-Api-Key' => 'api_key' }
      }.to_json
      post  api_v1_user_login_path,  :params =>req_body, :headers => headers # ,req_header
      json = JSON.parse(response.body)
      expect(json['status']).to eq 'SUCCESS'
      expect(json.key?('token')).to eq true
    end
  end
  describe "POST api::v1::user#create" do
    # user = Providers::Data.new_user()
    # req_header = Providers::Requests.header()
    it '新規作成に成功 ' do
      ddd = {
          nickname: "garga",
          password: "agaga",
          password_confirm: "agaga"
      }.to_json
      post  api_v1_user_create_path,  :params =>ddd, :headers => headers # ,req_header
      json = JSON.parse(response.body)
      expect(json['status']).to eq 'SUCCESS'
      expect(json.key?('token')).to eq true
    end
  end
end
