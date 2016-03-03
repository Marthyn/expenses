class HomeController < ApplicationController

  def index
    @expense = Expense.new
    @timerange = TimerangeInitializer.new(params).timerange
    @expenses = Expense.where(date: @timerange).order("date DESC").includes(:category, :shop)
  end
end
