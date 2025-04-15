require "test_helper"
class CategoryTest < ActiveSupport::TestCase
  test "Category validation" do
    category = Category.new
    category.title = nil
    category.body = "Minimum of 5 characters"
    assert_not category.save
  end

  test "belongs_to :user" do
    association = Category.reflect_on_association(:user)
    assert_equal :belongs_to, association.macro
  end

  test "has_many :tasks" do
    association = Category.reflect_on_association(:tasks)
    assert_equal :has_many, association.macro
  end
end
