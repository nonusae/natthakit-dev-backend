class CreatePortfolios < ActiveRecord::Migration[6.0]
  def change
    create_table :portfolios do |t|
      t.string :title, null: false
      t.string :company, null: false
      t.string :company_website, null: false
      t.string :location, null: false
      t.string :job_title, null: false
      t.string :description, null: false
      t.date :start_date, null: false
      t.date :end_date

      t.timestamps
    end
  end
end
