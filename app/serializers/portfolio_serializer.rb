# frozen_string_literal: true

class PortfolioSerializer < ApplicationSerializer
  attributes :id,
    :title,
    :company,
    :company_website,
    :location,
    :job_title,
    :description,
    :start_date,
    :end_date
end
