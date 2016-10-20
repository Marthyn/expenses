class HomeController < ApplicationController
  before_action :set_hashes_for_select

  def index
    @expense = Expense.new(date: Date.today, shop: Shop.by_usage.first, category: Category.by_usage.first)
    timerange_initializer = TimerangeInitializer.new(params)
    @timerange = timerange_initializer.timerange
    @selected_year = timerange_initializer.year
    @selected_month = timerange_initializer.month
    @expenses = Expense.where(date: @timerange).includes(:category, :shop).order(created_at: :desc)
  end

  def set_hashes_for_select
    @month_hash = []
    Date::MONTHNAMES.each_with_index do |name, index|
      @month_hash << [name, index] unless index.zero?
    end
    @year_hash = [2015, 2016, 2017]
  end
end
