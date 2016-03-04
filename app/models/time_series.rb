class TimeSeries
  def self.weekly(resource)
    WeeklyTimeSeries.new(resource)
  end

  def self.monthly(resource)
    MonthlyTimeSeries.new(resource)
  end

  def self.yearly(resource)
    YearlyTimeSeries.new(resource)
  end

  def serialize
    {
      labels: labels,
      datasets: [
        {
          data: data
        }
      ]
    }
  end

  def days
    @time_span.count
  end

  def entries_for_time_span
    expenses.where(date: range_for_entries)
  end

  def range_for_entries
    ((@time_span.first + 1.day)..(@time_span.last + 1.day))
  end

  private

  def labels
    @time_span.map { |date| date.strftime("%d/%m") }
  end

  def data
    @time_span.map { |date| expenses_per_day[date] || 0 }
  end

  def expenses_per_day
    @expenses_for_entity_per_day ||=
      expenses.order("DATE(date)").group("DATE(date)").sum(:amount)
  end

  def expenses
    if @resource
      @expenses ||= @resource.expenses
    else
      @expenses ||= Expense.all
    end
  end

  def expenses_per_day
    @expenses_for_entity_per_day ||=
      expenses.order("DATE(date)").group("DATE(date)").sum(:amount)
  end
end
