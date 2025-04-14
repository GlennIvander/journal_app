require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user

    @category = Category.create!(title: "Category 1", body: "Sample Body", user: @user)
    @task = Task.create!(task: "Task 1", body: "Details", category: @category)
  end

  test "should get index for category" do
    get category_tasks_path(@category)
    assert_response :success
  end
end
