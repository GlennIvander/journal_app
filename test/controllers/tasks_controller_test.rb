require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user

    @category = Category.create!(title: "Category 1", body: "Sample Body", user: @user)
    @task = Task.create!(task: "Task 1", body: "Details", due_date: Date.tomorrow, category: @category)
  end

  test "should get index for category" do
    get category_tasks_path(@category)
    assert_response :success
  end

  test "should show task" do
    get category_task_path(@category, @task)
    assert_response :success
  end

  test "should get edit task page" do
    get edit_category_task_path(@category, @task)
    assert_response :success
  end

  test "should update task" do
    patch category_task_path(@category, @task), params: {
      task: {
        task: "Updated Task",
        body: "Updated Details",
        due_date: Date.today
      }
    }
    assert_redirected_to category_tasks_path(@category)
  end

  test "should create task" do
      post category_tasks_path(@category), params: {
        task: {
          task: "New Task",
          body: "New Body",
          due_date: Date.today } }
    assert_redirected_to category_path(@category)
  end

  test "should destroy task" do
    assert_difference("Task.count", -1) do
      delete category_task_path(@category, @task)
    end
    assert_redirected_to category_path(@category)
  end
end
