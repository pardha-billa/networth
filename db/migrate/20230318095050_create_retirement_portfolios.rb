class CreateRetirementPortfolios < ActiveRecord::Migration[7.0]
  def change
    create_view :retirement_portfolios
  end
end
