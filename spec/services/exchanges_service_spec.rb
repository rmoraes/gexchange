require 'spec_helper'

RSpec.describe ExchangeService do
  context '#convert' do

    it 'Convert USD currency to BRL' do
      Stubs.request_currency
      quotation = ExchangeService.new(from: 'USD', to: 'BRL').convert
      
      expect(quotation.is_a? Numeric).to eql(true)
      expect(quotation).to eql(3.41325)
    end

    it 'Convert BTC criptocurrency to BRL' do
      Stubs.request_blockchain
      quotation = ExchangeService.new(from: 'BTC', to: 'BRL').convert
      
      expect(quotation.is_a? Numeric).to eql(true)
      expect(quotation).to eql(36034.89)
    end

  end
end