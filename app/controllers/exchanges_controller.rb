class ExchangesController < ApplicationController
  def index
  end
 
  def convert
    result = ExchangeService.new(exchange_params).convert
    render json: { result: result }
  end

  private 

  def exchange_params
    params.permit(:amount, :from, :to)
  end
end
