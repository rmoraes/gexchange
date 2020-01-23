require 'spec_helper'

RSpec.describe ExchangeService do
  
  let(:amount) { rand(1..9999) }

  context '#convert' do

    it 'Convert USD currency to BRL' do
      value = ExchangeService.new(amount: amount, from: 'USD', to: 'BRL').convert
      
      expect(value.is_a? Numeric).to eql(true)
      expect(value != 0).to eql(true)
    end

  end
end