class StatisticsController < ApplicationController

  def index
    @time_series = time_series_for()
  end

  def time_series_for(resource = nil)
    case params[:time_span]
    when "weekly" then TimeSeries.weekly(resource)
    when "yearly" then TimeSeries.yearly(resource)
    else TimeSeries.monthly(resource)
    end
  end
end
