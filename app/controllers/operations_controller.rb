class OperationsController < ApplicationController
  before_action :require_login
  before_action :set_operation, only: %i[ show edit update destroy ]
  before_action :set_categories
  before_action :set_category_name, only: %i[ index ]
  
  # GET /operations or /operations.json
  def index
    if params[:queryCategoryId].present?
      @operations = current_user.categories.find(params[:queryCategoryId]).operations
    else
      @operations = current_user.operations
      # @operations = Operation.joins(:category)
                            #  .where(categories: { user_id: current_user.id })
    end
  end

  # GET /operations/1 or /operations/1.json
  def show
  end

  # GET /operations/new
  def new
    @operation = Operation.new
  end

  # GET /operations/1/edit
  def edit
  end

  # POST /operations or /operations.json
  def create
    category = current_user.categories.find(operation_params[:category_id])
    @operation = category.operations.build(operation_params.except(:category_id))
    # @operation = Operation.new(operation_params)

    respond_to do |format|
      if @operation.save
        format.html { redirect_to @operation, notice: "Транзакція успішно створено." }
        format.json { render :show, status: :created, location: @operation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operations/1 or /operations/1.json
  def update
    respond_to do |format|
      if @operation.update(operation_params)
        format.html { redirect_to @operation, notice: "Транзакцію успішно оновлено.", status: :see_other }
        format.json { render :show, status: :ok, location: @operation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operations/1 or /operations/1.json
  def destroy
    @operation.destroy!

    respond_to do |format|
      format.html { redirect_to operations_path, notice: "Транзакцію було успішно знищено.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

    def set_operation
      @operation = Operation.joins(:category)
                          .where(categories: { user_id: current_user.id })
                          .find(params[:id])
      # @operation = Operation.find(params[:id])
    end

    def set_category_name
      @category_name = current_user.categories.find_by_id(params[:queryCategoryId])&.name
    end

    def set_categories
      @categories = current_user.categories
    end

    def operation_params
      params.require(:operation).permit(:amount, :odate, :description, :category_id, :otype)
    end
end
