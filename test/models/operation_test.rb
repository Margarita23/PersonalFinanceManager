require "test_helper"

class OperationTest < ActiveSupport::TestCase
  
  test "should filter operations between two dates" do
    op1 = operations(:one)        # дата: 2026-02-03
    op2 = operations(:food_1)     # дата: 2026-01-02
    op3 = operations(:food_2)     # дата: 2026-01-05

    filtered = Operation.between_dates(Date.parse("2026-01-01"), Date.parse("2026-01-31"))

    assert_includes filtered, op2
    assert_includes filtered, op3
    assert_not_includes filtered, op1
  end

  test "should show otype_human 'Дохід' when operation have otype income" do
    assert_equal('Дохід', operations(:one).otype_human)
  end

  test "should show otype_human 'Витрата' when operation have otype income" do
    assert_equal('Витрата', operations(:food_1).otype_human)
  end
end
