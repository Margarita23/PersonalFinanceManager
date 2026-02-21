require "test_helper"

class Reports::ByDatesTest < ActiveSupport::TestCase
  fixtures :operations, :categories

  test "returns grouped data by dates for full period" do
    result = Reports::ByDates.call(nil, nil)

    assert result[:labels].any?
    assert result[:expense].any?
    assert_equal result[:labels].size, result[:expense].size
  end

  test "filters operations by given date range" do
    start_date = "2026-02-01"
    end_date   = "2026-02-10"

    result = Reports::ByDates.call(start_date, end_date)

    result[:labels].each do |date|
      assert date >= Date.parse(start_date)
      assert date <= Date.parse(end_date)
    end
  end
end
