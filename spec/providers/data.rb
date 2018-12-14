require 'rails_helper'
module Providers
  class Data
    class << self
      def new_user()
        return User.create(
          nickname: "Bob",
          email: "Bob@rsp.ec",
          birthday: "2010/01/01",
          password: "xxxxx",
          status: 10,
        )

      end
      def new_sensor(user)
        return Sensor.create(
          user_id: user.id,
          name: "センサー1",
          explanation: "-20 - 80度まで計測可能。",
        )
      end
    end
  end
end
