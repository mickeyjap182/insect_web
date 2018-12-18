require 'providers/data'
module Providers
  class Requests
    class << self
      def header()
        return { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
      end
    end
  end
end
