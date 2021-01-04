module Api
  module V1
    class PortfoliosController < SecuredController
      include ErrorsControllerLogic

      skip_before_action :authorize_request, only: [:index, :show]

      def index
        @portfolios = Portfolio.all
        render json: PortfolioSerializer.new(@portfolios)
      end

      def show
        @portfolio = Portfolio.find(params[:id])
        render json: PortfolioSerializer.new(@portfolio)
      end

      def create
        @portfolio = Portfolio.new(portfolio_params)
        if @portfolio.save
          render json: PortfolioSerializer.new(@portfolio)
        else
          render json: {errors: @portfolio.errors}
        end
      end

      private

      def portfolio_params
        params.permit(
          :title,
          :company,
          :location,
          :description,
          :company_website,
          :job_title,
          :start_date,
          :end_date
        )
      end
    end
  end
end

