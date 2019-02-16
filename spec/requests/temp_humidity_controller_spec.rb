require 'rails_helper'
require 'providers/requests'

RSpec.describe 'Users', :type => :request do
  begin
    # user = Providers::Data.new_user()
    req_header = Providers::Requests.header()
  rescue => exception
    puts exception.message
  end
  describe "POST api::v1::temp_humidity#create" do
    context "パラメータが足りない場合" do
      let!(:data) {
        {
          sensor_id: 1,
          temp: 30.0,
          humidity: 90.0 ,
        }.to_json
      }
      it '入力エラーとなる ' do
        post  api_v1_temp_humidity_create_path,  :params =>data, :headers => req_header # ,req_header
        json = JSON.parse(response.body)

        expect(json['status']).to eq 'FAILURE'
        expect(json['message']).to eq 'パラメータに不足があります。'
      end
    end
    context "パラメータの値に誤りがある場合" do
      let!(:data) {
        {
          sensor_id: 'invalid',
          temp: 30.0,
          humidity: 90.0 ,
          inspected_at: 90.0 ,
        }.to_json
      }
      it '入力エラーとなる ' do
        post  api_v1_temp_humidity_create_path,  :params =>data, :headers => req_header # ,req_header
        json = JSON.parse(response.body)

        expect(json['status']).to eq 'FAILURE'
        # expect(json['message']).to eq '入力値に誤りがあります。'
      end
    end
  end
end
