class RetirementPortfolioController < ApplicationController
    def index
        @records = RetirementPortfolio.all
        @equity = @records.sum{|x| (x.nav * x.units)}.round(0)
        @debt = FixedAsset.sum{|x| x.amount}.round(0)
        @profit = (@equity - @records.sum(&:amount)).round(0)
        @ep = ((@equity.to_f/(@equity+@debt))*100).round(0)
        @dp = ((@debt.to_f/(@equity+@debt))*100).round(0)

    end
end