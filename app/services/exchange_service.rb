require 'rest-client'
require 'json'
 
class ExchangeService
  def initialize(params = {})
    @params = params
  end
 
  def convert
    begin
      api_url = Rails.application.credentials[Rails.env.to_sym][:currency_api_url]
      api_key = Rails.application.credentials[Rails.env.to_sym][:currency_api_key]

      response = RestClient.get("#{api_url}?token=#{api_key}&currency=#{@params[:from]}/#{@params[:to]}")

      result = JSON.parse(response.body)['currency'][0]['value'].to_f
      
      result * @params[:amount]

    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end
end