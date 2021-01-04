class Portfolio < ApplicationRecord
  validates_presence_of :title,
    :company,
    :company_website,
    :location,
    :job_title,
    :description,
    :start_date
end
