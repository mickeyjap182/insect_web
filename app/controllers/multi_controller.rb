class MultiController < ActionController::Base
   def index
     # render html: "hello,WWW world!"
     @records = User.all
   end
end
