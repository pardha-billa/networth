class UpdateFundNavs
    def self.process
        codes = Fund.pluck(:fund_code).compact.uniq
        codes.each do |code|
            response = FindNav.new(code).process
            if response
                Fund.where(fund_code: code).update(
                    nav_at: response['date'],
                    nav: response["nav"].to_f
                )
            end
        end
    end
end