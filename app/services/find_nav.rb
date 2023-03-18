class FindNav
    attr_accessor :fund, :date
    def initialize(fund, date = Date.today-1)
        @fund = fund
        @date = date
    end

    def process
        url = "https://api.mfapi.in/mf/#{fund}"
        response = Faraday.get(url)
        data = JSON.parse(response.body)["data"]
        data.find{|x| x["date"].to_date == date}
    end
end