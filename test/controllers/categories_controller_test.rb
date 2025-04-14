require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user

    @category = Category.create!(
      title: "Sample category title",
      body: "Sample category body",
      user: @user
    )
  end

  test "should get index" do
    get categories_path
    assert_response :success
  end

  test "should get new page" do
    get new_category_path
    assert_response :success
  end

  test "should show" do
    get category_path(@category)
    assert_response :success
  end

  test "should get edit for a category" do
    get edit_category_path(@category)
    assert_response :success
  end

  test "should create a category" do
    post categories_path, params: {
      category: {
        title: "New Title",
        body: "New Body",
        user_id: @user.id
      }
    }
    assert_response :redirect
  end

  test "should update a category" do
    patch category_path(@category), params: {
      category: {
        title: "Updated Title",
        body: "Updated Body",
        user_id: @user.id
      }
    }
    assert_response :redirect
  end
end
