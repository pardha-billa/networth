class RetirementPortfolioController < ApplicationController
    def index
        @records = RetirementPortfolio.all
    end
end