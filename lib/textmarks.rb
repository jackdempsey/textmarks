require 'httparty'

class Textmarks
  include HTTParty
  format :json
  base_uri 'dev1.api2.textmarks.com'

  class << self
    def echo(str)
      get('/Test/echo', :str => str)
    end
  end
end
