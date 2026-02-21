class ReportsController < ApplicationController
  before_action :require_login
  before_action :set_categories, only: %i[ index ]
  before_action :set_operations, only: %i[ index ]

  def index
  end

  def report_by_category
    @report = Reports::ByCategory.call(current_user, params[:start], params[:end])
    @report[:otype] = params[:otype]
  end

  def report_by_dates
    @report = Reports::ByDates.call(current_user, params[:start], params[:end])
    @report[:otype] = params[:otype]
  end

  private

  def set_operations
    @operations = Operation.joins(:category).where(categories: { user_id: current_user.id })
  end

  def set_categories
    @categories = current_user.categories
  end

end
