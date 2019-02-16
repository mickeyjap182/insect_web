require 'test_helper'
require 'date'
class UserTest < ActiveSupport::TestCase
    def setup
        @user = User.new(nickname:"hana", email:"sample@dummy2242.com",
          birthday:Date.new(2007, 5 ,30), password: "aaaa")
          # created_at:"2016-05-23 19:05:58 UTC", updated_at:"2016-05-23 19:05:58 UTC")
    end
    # def teardown
    # end
    test "has created?" do
        assert @user.valid?
    end
    test "fail" do
      assert true
    end
end
