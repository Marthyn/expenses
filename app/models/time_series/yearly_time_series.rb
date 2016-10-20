class TimeSeries::YearlyTimeSeries < TimeSeries
  def initialize(resource = nil)
    @resource = resource
    @time_span = (364.days.ago.to_date..Date.current).freeze
  end

  def chart
    "/charts/line_chart"
  end

  def title
    I18n.t("charts.expenses_per_week")
  end

  private

  def data
    @time_span.step(7).map { |week| expenses_per_week(week) }
  end

  def labels
    @time_span.step(7).map { |date| date.strftime("%V") }
  end

  def colors
    @time_span.step(7).map { |date| date.strftime("%V").pastel_color }
  end

  def expenses_per_week(week)
    expenses.where(date: ((week - 1.week)..week)).sum(:amount)
  end
end
