require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get multiplic" do
    get static_pages_multiplic_url
    assert_response :success
  end

end
