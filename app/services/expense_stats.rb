class ExpenseStats
  def initialize(current_user, timerange, entity = nil)
    @current_user = current_user
    @budget = current_user.organization.monthly_budget
    @entity = entity
    @timerange = timerange
  end

  def percentage_for_entity
    return 0 if timerange_total.zero? || timerange_entity_total.zero?
    Float((amount_for_entity_timerange / amount_for_timerange) * 100).round
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

  def budget
    Float(@timerange.count / 30).round * @budget
  end

  def expenses
    @expenses ||= Expense.where(date: @timerange)
  end

  def entity_over_budget?
    amount_for_entity_timerange > @entity.monthly_budget
  end

  def over_budget?
    amount_for_timerange > budget
  end

  def total_spent
    @total_spent ||= Float(budget - total_left).round(2)
  end

  def current_month?
    @current_month ||= @timerange.first > Date.today || @timerange.last < Date.today
  end

  def end_of_range
    current_month? ? @timerange.last : Date.today
  end

  def per_day_spent
    @spent_per_day ||= Float(amount_for_timerange / ((end_of_range - @timerange.first) +1)).round(2)
  end

  def per_day_left
    @left_per_day ||= Float(total_left / (@timerange.last - Date.today)).round(2)
  end

  def total_left
    Float(budget - amount_for_timerange).round(2)
  end

  def serialized_expenses_for_entity_colection(collection)
    {
      labels: collection.map { |s| s.name },
      datasets: [
        backgroundColor: colors_for_entity_collection(collection),
        data: values_for_entity_collection(collection),
      ]
    }
  end

  def colors_for_entity_collection(collection)
    collection.map { |s| s.name.pastel_color }
  end

  def values_for_entity_collection(collection)
    collection.map do |subject|
      @subject = subject
      subject.expenses.where(date: @timerange).sum(:amount)
    end
  end

  def expenses_for_entity_colection(collection)
    collection.map do |subject|
      @subject = subject
      {
        value: subject.expenses.where(date: @timerange).sum(:amount),
        color: subject.name.pastel_color,
        label: subject.name,

      }
    end
  end
end
