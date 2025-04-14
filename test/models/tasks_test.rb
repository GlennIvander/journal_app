require "test_helper"
class TaskTest < ActiveSupport::TestCase
  test "Category validation" do
    task = Task.new
    task.task = nil
    task.body = "Minimum of 5 characters"
    assert_not task.save
  end

  test "should belong to a user" do
    association = Task.reflect_on_association(:category)
    assert_equal :belongs_to, association.macro
  end
end
