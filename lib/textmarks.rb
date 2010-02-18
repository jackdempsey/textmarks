require 'httparty'

class Textmarks
  include HTTParty
  format :json

  base_uri 'dev1.api2.textmarks.com'
  default_params :api_key => ::TEXTMARKS_API_KEY if defined?(::TEXTMARKS_API_KEY)

  class << self
    @package = nil

    def method_missing(symbol, *args)
      if @package
        result = post "/#{@package}/#{symbol}/", :query => args.first
        @package = nil
        result
      else
        @package = symbol
        self
      end
    end
  end
end
