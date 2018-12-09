class MultiController < ActionController::Base
   def index
     # render html: "hello,WWW world!"
     @records = User.all
     render partial: 'layouts/application'
   end
end
