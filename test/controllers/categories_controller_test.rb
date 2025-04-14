require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
include Devise::Test::IntegrationHelpers

  test "should get index" do
    get "/categories"
    assert_response :success
  end

  setup do
    @user = users(:one)
    sign_in @user
  end

  test "should show" do
    category = Category.create!(title: "Test Title", body: "Test body", user: @user)
    get category_path(category)
    assert_response :success
  end

  test "should get new page" do
    get new_category_path
    assert_response :success
  end

  test "should get edit for own category" do
    category = Category.create!(title: "User's Category", body: "Sample Body", user: @user)
    get edit_category_path(category)
    assert_response :success
  end

  test "should get create" do
    post categories_path, params: { category: { title: "Test Title", body: "Test body", user_id: 1 } }
    assert_response :redirect
  end

  test "should update" do
    category = Category.create!(title: "Old Title", body: "Old body", user: @user)
    patch category_path(category), params: { category: { title: "Test Title", body: "Test body", user_id: @user.id } }
    assert_response :redirect
  end
end
