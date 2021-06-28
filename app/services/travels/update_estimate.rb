require 'rest-client'
require 'json'

module Travels
  class UpdateEstimate

    BASE_URL_REST_COUNTRIES = "https://restcountries.eu/rest/v2".freeze
    BASE_URL_EXCHANGE = "https://v6.exchangerate-api.com/v6/238b04f89440ad53b4199757".freeze

    def self.all_countries
      begin
        response = JSON.parse(RestClient.get("#{BASE_URL_REST_COUNTRIES}/all"), symbolize_names: true)
      rescue
        response = []
      end
      response.map{|c| [c[:name], c[:alpha3Code]]}.sort_by { |v| v.first }
    end

    def self.country(code)
      begin
        response = JSON.parse(RestClient.get("#{BASE_URL_REST_COUNTRIES}/alpha/#{code}"), symbolize_names: true)
      rescue => error
        response = [error: error]
      end
      response
    end

    def self.convert_estimate(estimate, destiny)
      begin
        response = JSON.parse(RestClient.
          get("#{BASE_URL_EXCHANGE}/pair/BRL/#{destiny}/#{estimate}"),
                              symbolize_names: true)
      rescue => error
        response = [error: error]
      end
      response[:conversion_result]
    end

  end
end