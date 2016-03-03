class TimerangeInitializer

  def initialize(params)
    @month = params[:month] ? params[:month].to_i : nil
    @year = params[:year] ? params[:year].to_i : nil
  end

  def timerange
    date.beginning_of_month..date.end_of_month
  end

  def date
    puts year, month
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
