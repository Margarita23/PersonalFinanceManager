require "test_helper"

class Reports::GroupedResultBuilderTest < ActiveSupport::TestCase
  test "groups income and expense correctly" do
    data = {
      ["Food", "expense"] => 100,
      ["Food", "income"] => 50,
      ["Transport", "expense"] => 70
    }

    result = Reports::GroupedResultBuilder.call(data)

    assert_equal ["Food", "Transport"], result[:labels]
    assert_equal [50.0, 0], result[:income]
    assert_equal [100.0, 70.0], result[:expense]
  end
end
