class StatisticsController < ApplicationController

  def index
    @time_series = time_series_for
    @all_time = all_time
  end

  def time_series_for(resource = nil)
    case params[:time_span]
    when "weekly" then TimeSeries.weekly(resource)
    when "yearly" then TimeSeries.yearly(resource)
    else TimeSeries.monthly(resource)
    end
  end

  def all_time(resource = nil)
    TimeSeries.all_time(resource)
  end
end
