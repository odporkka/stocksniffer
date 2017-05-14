class AlphaVantageApi

  def self.fetch_weekly(symbol)
    Rails.cache.fetch(symbol, expires_in: 1.day) { weekly_time_series(symbol) }
  end

  def self.three_month_weekly(symbol)
    data =  self.fetch_weekly(symbol)
    return data[0, 13]
  end

  def self.weekly_time_series(symbol)
    url = "http://www.alphavantage.co/query?function=TIME_SERIES_WEEKLY&symbol=#{symbol}&apikey=#{self.key}"
    response = HTTParty.get "#{url}"

    array = response['Weekly Time Series']
    data = array.collect { |week| [week[0], week[1]['4. close']] }
    return data
  end

  def self.ten_day_time_series(symbol)
    url = "http://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=#{symbol}&apikey=#{self.key}"
    response = HTTParty.get "#{url}"

    array = response['Time Series (Daily)']
    data = array.collect { |day| [day[0], day[1]['4. close']] }
    return data
  end

  def self.key
    "ZMEQ"
  end
end