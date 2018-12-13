class RearingController < ActionController::Base
   def index
     # render html: "hello,WWW world!"
     @records = User.all
     # @records = [
     #   {id:"2018/12/07 13:00", nickname:"21.4(C)", email:"72.5(%)"},
     #   {id:"2018/12/07 12:30", nickname:"21.1(C)", email:"71.8(%)"}
     # ]
     render layout: 'layouts/application'
   end
end
