class ExpenseStats
  BUDGET = 400

  def initialize(timerange, entity = nil)
    @entity = entity
    @timerange = timerange
  end

  def percentage_for_entity
    return 0 if timerange_total == 0 || timerange_entity_total == 0
    puts amount_for_timerange, amount_for_timerange
    Float((amount_for_entity_timerange / amount_for_timerange) * 100).round()
  end

  def amount_for_timerange
    @amount_for_timerange ||= expenses.sum(:amount)
  end

  def amount_for_entity_timerange
    @amount_for_entity_timerange ||= expenses_for_entity.sum(:amount)
  end

  def timerange_total
    @timerange_total ||= expenses.count
  end

  def timerange_entity_total
    @timerange_entity_total ||= expenses_for_entity.count
  end

  def expenses_for_entity
    @expenses_for_entity ||= @entity.expenses.where(date: @timerange)
  end

  def expenses
    @expenses ||= Expense.where(date: @timerange)
  end

  def allowed_per_day
    @allowed_per_day ||= Float(BUDGET / @timerange.count).round(2)
  end

  def total_spent
    @total_spent ||= Float(BUDGET - budget_left).round(2)
  end

  def spent_per_day
    @spent_per_day ||= Float(amount_for_timerange / ((Date.today - @timerange.first) +1)).round(2)
  end

  def left_per_day
    @left_per_day ||= Float(budget_left / (@timerange.last - Date.today)).round(2)
  end

  def budget_left
    Float(BUDGET - amount_for_timerange).round(2)
  end
end
