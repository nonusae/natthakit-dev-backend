module Api
  module V1
    class PortfoliosController < ApplicationController
      def index
        render json: {
          data: [1,2,3]
        }
      end
    end
  end
end

