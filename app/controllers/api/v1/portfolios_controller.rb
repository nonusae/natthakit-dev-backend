module Api
  module V1
    class PortfoliosController < SecuredController
      include ErrorsControllerLogic

      before_action :set_portfolio, except: [:index, :create]
      skip_before_action :authorize_request, only: [:index, :show]

      def index
        @portfolios = Portfolio.all
        render json: PortfolioSerializer.new(@portfolios)
      end

      def show
        render json: PortfolioSerializer.new(@portfolio)
      end

      def create
        @portfolio = authorize(Portfolio.new(portfolio_params))
        @portfolio.save!
        render json: PortfolioSerializer.new(@portfolio)
      end

      def update
        @portfolio.attributes = portfolio_params
        @portfolio.save!
        render json: PortfolioSerializer.new(@portfolio)
      end

      def destroy
        @portfolio.destroy
        render json: { id: params[:id] }
      end

      private

      def set_portfolio
        @portfolio ||= authorize(Portfolio.find(params[:id]))
      end

      def portfolio_params
        params.permit(
          :id,
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

