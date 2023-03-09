# Write your code here
require 'net/http'
require 'open-uri'
require 'json'

class GetRequester
    attr_accessor :url
    def initialize(url)
        @url=url
    end

    def get_response_body
        uri = URI.parse(@url)
        response = Net::HTTP.get_response(uri)
        response.body
    end

    def parse_json
        parsed_data = JSON.parse(self.get_response_body)
        parsed_data.collect do|person|
            person["name"]
        end
    end
end