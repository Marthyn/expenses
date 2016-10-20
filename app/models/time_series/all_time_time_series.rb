class TimeSeries::AllTimeTimeSeries < TimeSeries
  def initialize(resource = nil)
    @resource = resource
    @time_span = time_span.freeze
  end

  def divider
    time_span.count / 24
  end

  def time_span
    Expense.first.created_at.to_date..Date.current
  end

  def chart
    "/charts/line_chart"
  end

  def title
    "All time expenses divided by 25 equal portions of time"
  end

  private

  def data
    @time_span.step(divider).map { |week| expenses_per_week(week) }
  end

  def labels
    @time_span.step(divider).map { |date| "#{(date - divider.days).strftime} - #{date.strftime}" }
  end

  def colors
    @time_span.step(divider).map { |date| "#{(date - divider.days).strftime} - #{date.strftime}".pastel_color }
  end

  def expenses_per_week(week)
    expenses.where(date: ((week - divider.days)..week)).sum(:amount)
  end
end
