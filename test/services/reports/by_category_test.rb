require "test_helper"

class Reports::ByCategoryTest < ActiveSupport::TestCase
  fixtures :operations, :categories

  test "returns grouped data by category" do
    result = Reports::ByCategory.call(nil, nil)

    assert result[:labels].include?("Продукти")
    assert_equal result[:labels].size, result[:expense].size
  end

  test "filters categories by date range" do
    start_date = "2026-01-01"
    end_date   = "2026-01-31"

    result = Reports::ByCategory.call(start_date, end_date)

    assert result[:labels].any?
    assert_equal result[:labels].size, result[:expense].size
  end
end
