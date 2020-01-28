# frozen_string_literal: true

require 'rest-client'
require 'json'

class ExchangeService
  def initialize(params = {})
    @from = params[:from].presence || 'USD'
    @to   = params[:to].presence   || 'BRL'
  end

  def convert
    if [@from, @to].include?('BTC')
      bitcoin(@from, @to)

    else
      currency(@from, @to)
    end
  end

  private
    def currency(from, to)
      response = RestClient.get "#{api(:currency_api)}#{from}/#{to}"

      data = JSON.parse(response.body)

      return data['error'] if data['status'].eql?(false)

      data['currency'][0]['value'].to_f

    rescue RestClient::ExceptionWithResponse => e
      e.response
    end


    def bitcoin(from, to)
      response  = RestClient.get api(:bitcoin_api)

      currency  = from.eql?('BTC') ? to : from
      quotation = JSON.parse(response.body)[currency]['last']

      from.eql?('BTC') ? quotation : (BigDecimal(1) / BigDecimal(quotation.to_s)).round(8).to_s

    rescue RestClient::ExceptionWithResponse => e
      e.response
    end


    def api(key)
      Rails.application.credentials[Rails.env.to_sym][key]
    end
end
