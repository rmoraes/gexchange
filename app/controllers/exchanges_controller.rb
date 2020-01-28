# frozen_string_literal: true

class ExchangesController < ApplicationController
  def index
    @quotation = ExchangeService.new(exchange_params).convert
  end

  private
    def exchange_params
      params.permit(:from, :to)
    end
end
