class RearingController < ActionController::Base
   def index
     @users = User.all
     @facilities = [
       {:id => 1, :name=> 'センサー1', :type_cd=> 'DHT22', :explanation=> '2018/12/15'},
     ]
     @tempHumidities = [
       {:id => 1, :temp=> 24.5, :humidity=> 78.2, :inspected_at=> '2018/12/15'},
     ]
     render layout: 'layouts/application'
   end

   def login
     render layout: 'layouts/public'
   end
end
