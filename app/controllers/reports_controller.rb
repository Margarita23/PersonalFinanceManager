class ReportsController < ApplicationController
  before_action :set_categories, only: %i[ index ]
  before_action :set_operations, only: %i[ index ]

  def index
  end

  def report_by_category
    @report = Reports::ByCategory.call(params[:start], params[:end])
    @report[:otype] = params[:otype]
  end

  def report_by_dates
    @report = Reports::ByDates.call(params[:start], params[:end])
    @report[:otype] = params[:otype]
  end

  private

  def set_operations
    @operations = Operation.all
  end

  def set_categories
    @categories = Category.all
  end

end
