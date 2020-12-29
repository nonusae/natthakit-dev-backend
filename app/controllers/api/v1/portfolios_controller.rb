module Api
  module V1
    class PortfoliosController < ApplicationController
      def index
        @portfolios = Portfolio.all
        render json: @portfolios
      end
    end
  end
end

