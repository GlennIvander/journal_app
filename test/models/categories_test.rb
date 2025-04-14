require "test_helper"
class CategoryTest < ActiveSupport::TestCase
  test "Category validation" do
    category = Category.new
    category.title = "Should be true"
    category.body = "Minimum of 5 characters"
    assert_not category.save
  end
end
