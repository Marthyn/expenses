class HomeController < ApplicationController

  def index
    @expense = Expense.new
    @timerange = Date.today.beginning_of_month..Date.today.end_of_month
    @expenses = Expense.where(date: @timerange).order("date DESC").limit(10)
  end

end
