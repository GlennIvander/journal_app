class TasksController < ApplicationController
  before_action :set_id
  before_action :set_action, only: %i[show edit update destroy]

  def index
    @tasks = @category.tasks
  end

  def show; end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to category_tasks_path(@category), notice: "Updated successfully."
    else
      flash[:alert] = "Oh no! Updated unsuccessfully."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @task.destroy
      redirect_to category_path(@category), status: :see_other
      flash[:alert] = "Deleted successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @task = @category.tasks.new(task_params) 
    if @task.save
      redirect_to category_path(@category), notice: "Task created successfully.", status: :see_other
    else
      flash[:alert] = "Oh no! Task created unsuccessfully."
      redirect_to category_path(@category)
    end
  end

  private
  def task_params
    params.require(:task).permit(:task, :body, :due_date)
  end

  def set_id
    @category = Category.find(params[:category_id])
  end

  def set_action
    @task = @category.tasks.find(params[:id])
  end
end
