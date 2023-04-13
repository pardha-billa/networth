class UpdateRetirementPortfoliosToVersion2 < ActiveRecord::Migration[7.0]
  def change
  
    update_view :retirement_portfolios, version: 2, revert_to_version: 1
  end
end
