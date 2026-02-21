class OperationsController < ApplicationController
  before_action :set_operation, only: %i[ show edit update destroy ]
  before_action :set_categories
  before_action :set_category_name, only: %i[ index ]
  
  # GET /operations or /operations.json
  def index
    categoryId = params[:queryCategoryId]
    @operations = categoryId.nil? ? Operation.all : Operation.where(category_id: categoryId)
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
    @operation = Operation.new(operation_params)

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
      @operation = Operation.find(params[:id])
    end

    def set_category_name
      @category_name = Category.find_by_id(params[:queryCategoryId])&.name
    end

    def set_categories
      @categories = Category.all
    end

    def operation_params
      params.require(:operation).permit(:amount, :odate, :description, :category_id, :otype)
    end
end
