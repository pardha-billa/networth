class RetirementPortfolioController < ApplicationController
    def index
        @records = RetirementPortfolio.all.sort_by{|x| x.cur_value-x.inv_value}
        @equity = @records.sum{|x| (x.cur_value)}.round(0)
        @debt = FixedAsset.sum{|x| x.amount}.round(0)
        @profit = (@equity - @records.sum(&:inv_value)).round(0)
        @ep = ((@equity.to_f/(@equity+@debt))*100).round(0)
        @dp = ((@debt.to_f/(@equity+@debt))*100).round(0)

          @funds = Fund.joins(:transactions).references(:transactions).
          group("fund_name, transactions.transaction_date, transactions.transaction_type").
          select('fund_name, transactions.transaction_date, sum(amount) as amount, max(transactions.nav) as tr_nav, max(funds.nav) as fun_nav').to_a
          @irr = @records.map do |x| 
            trans = @funds.select{|f| f.fund_name == x.fund_name}.map{|x| {value: x.amount, date: x.transaction_date}}
            trans.unshift({value: -(x.cur_value), date: x.nav_at})
            xirrfunc = Xirr.new(trans)
            z = [xirrfunc.zero]
            nlsolve(xirrfunc, z)
            {fund_name: x.fund_name, xirr:(z[0].to_f*100).round(2) }
          end
          trans = @funds.map{|x| {value: x.amount, date: x.transaction_date}}
          trans.unshift({value: -(@equity),date: @records.first.nav_at})
          xirrfunc = Xirr.new(trans)
          z = [xirrfunc.zero]
          nlsolve(xirrfunc, z)
          @xirr = (z[0].to_f*100).round(2)

    end
end