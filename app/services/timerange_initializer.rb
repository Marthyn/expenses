class TimerangeInitializer

  def initialize(params)
    @month = params[:date_filters] && params[:date_filters][:month] ? params[:date_filters][:month].to_i : nil
    @year = params[:date_filters] && params[:date_filters][:year] ? params[:date_filters][:year].to_i : nil
  end

  def timerange
    date.beginning_of_month..date.end_of_month
  end

  def date
    @date ||= Date.new(year, month)
  end
  
  def month
    @month ||= today.month
  end

  def year
    @year ||= today.year
  end

  def today
    @today ||= Date.today
  end
end
