class ApplicationController < ActionController::Base
   def top
     render html: "hello, world!"
   end
   def temphumdity
     render html: "TODO:一覧の作成"
   end
end
