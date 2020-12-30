module Api
  module V1
    class PortfoliosController < ApplicationController
      def index
        @portfolios = Portfolio.all
        render json: @portfolios
      end

      def show
        @portfolio = Portfolio.find_by(id: params[:id])
        if @portfolio.present?
          render json: @portfolio
        else
          render json: {error: 'Api Error: not found', status: 422}
        end
      end
    end
  end
end

