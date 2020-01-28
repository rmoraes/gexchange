module Stubs 

  module_function

  def request_currency
    WebMock.stub_request(:get, /currencydatafeed.com/ ).with(headers: {'Accept'=>'*/*'}).to_return(status: 200, 
    body: '{
      "status": true,
        "currency": [{
          "currency": "USD/BRL",
          "value": "3.41325",
          "date": "2018-04-20 17:22:59",
           "type": "original"
        }]
      }', headers: {})
  end 


  def request_blockchain 

    WebMock.stub_request(:get, /blockchain.info/).with(headers: { 'Accept'=>'*/*' }).to_return(status: 200, 
    body: '{ 
      "BRL":{
        "15m": 36034.89, 
        "last": 36034.89, 
        "buy": 36034.89, 
        "sell": 36034.89, 
        "symbol": "R$"
      }
    }', headers: {})
  end 
end