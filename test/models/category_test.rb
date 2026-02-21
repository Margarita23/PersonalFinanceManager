require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "check the 'Категорія_1" do
    cat_1 = Category.find_by(name: 'Категорія_1')
    assert_equal('Категорія_1', cat_1.name)
  end
end
