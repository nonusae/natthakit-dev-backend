module Api
  module V1
    class PortfoliosController < ApplicationController
      include ErrorsControllerLogic

      def index
        @portfolios = Portfolio.all
        render json: PortfolioSerializer.new(@portfolios)
      end

      def show
        @portfolio = Portfolio.find(params[:id])
        render json: PortfolioSerializer.new(@portfolio)
      end
    end
  end
end

