class RearingController < ActionController::Base
   def index
     # render html: "hello,WWW world!"
     @records = User.all
     render layout: 'layouts/application'
   end
end
