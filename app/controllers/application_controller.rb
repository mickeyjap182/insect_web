class ApplicationController < ActionController::Base
   def top
     render html: "hello, world!"
   end
   def multiplication
     render html: "九九一覧"
   end
end
