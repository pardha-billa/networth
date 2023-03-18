class RetirementPortfolioController < ApplicationController
    def index
        Fund.joins(:transactions).select()
        where(fund_type: 'Equity', goal_name: 'Retirement').
    end
end