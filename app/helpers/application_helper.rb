# frozen_string_literal: true

module ApplicationHelper
  def currencies
    [
      ['Moeda', ['AUD', 'BRL', 'CAD', 'CHF', 'CNY', 'DKK', 'EUR', 'GBP', 'HKD', 'INR',
                'JPY', 'KRW', 'NZD', 'PLN', 'RUB', 'SEK', 'SGD', 'THB', 'USD']
      ],

      ['Criptomoedas', ['BTC']]
     ]
  end
end
