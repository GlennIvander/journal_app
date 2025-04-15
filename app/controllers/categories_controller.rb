class CategoriesController < ApplicationController
  before_action :set_id, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :correct_user, only: [ :edit, :update ]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @categories = Category.all
    @cats = current_user.categories
  end

  def show
    @task = @category.tasks.new
  end

  def edit; end

  def new
    @category = current_user.categories.new
  end

  def create
    @category = current_user.categories.new(category_params)
    if @category.save
      redirect_to @category, notice: "Category: #{@category.title} saved successfully"
    else
      flash[:alert] = "Oh no! Created unsuccessfully."
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @category.update(category_params)
      redirect_to @category
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def category_params
    params.require(:category).permit(:title, :body, :user_id)
  end

  def correct_user
    @category = current_user.categories.find_by(id: params[:id])
    redirect_to root_path, notice: "Not authorized to edit this category" if @category.nil?
  end

  def set_id
    @category = current_user.categories.find(params[:id])
  end

  def record_not_found
    redirect_to categories_path, alert: "Record does not exist"
  end
end
