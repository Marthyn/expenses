class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]

  # GET /expenses
  def index
    @expenses = Expense.all
  end

  # GET /expenses/1
  def show
  end

  # GET /expenses/new
  def new
    @expense = Expense.new
  end

  # GET /expenses/1/edit
  def edit
  end

  # POST /expenses
  def create
    @expense = Expense.new(expense_params)
    @expense.date = Date.today
    if @expense.save
      redirect_to root_path, notice: 'Expense was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /expenses/1
  def update
    if @expense.update(expense_params)
      redirect_to @expense, notice: 'Expense was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /expenses/1
  def destroy
    @expense.destroy
    redirect_to expenses_url, notice: 'Expense was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def expense_params
      params.require(:expense).permit(:description, :amount, :shop_id, :category_id)
    end
end
