class HomeController < ApplicationController
  before_filter :set_hashes_for_select

  def index
    @expense = Expense.new
    timerange_initializer = TimerangeInitializer.new(params)
    @timerange = timerange_initializer.timerange
    @selected_year = timerange_initializer.year
    @selected_month = timerange_initializer.month
    @expenses = Expense.where(date: @timerange).order("date DESC").includes(:category, :shop)
  end

  def set_hashes_for_select
    @month_hash = []
    Date::MONTHNAMES.each_with_index do |name, index|
      unless index == 0
        @month_hash << [name, index]
      end
    end
    puts @month_hash.inspect
    @year_hash = [2015, 2016, 2017]
  end
end
