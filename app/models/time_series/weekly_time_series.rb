class TimeSeries::WeeklyTimeSeries < TimeSeries
  def initialize(resource = nil)
    @resource = resource
    @time_span = (6.days.ago.to_date..Date.current).freeze
  end

  def chart
    "/charts/bar_chart"
  end
end
