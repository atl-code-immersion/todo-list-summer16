class TasksController < ApplicationController
  before_action :all_tasks, only: [:index, :create, :update, :destroy]
  before_action :set_task, only: [:edit, :update, :destroy]


  def same_day_tasks
    @tasks = []
    @date = params[:deadline][0..9]

    Task.all.each do |task|
      if task.deadline[0..9] == @date
        @tasks.push(task)
      end
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    @task.dl_dt = @task.datified_dl
    @task.save
  end

  def update
    @task.update(task_params)
    @task.dl_dt = @task.datified_dl
    @task.save
  end

  def destroy
    @task.destroy
  end

  private
    # The Lounge - welcome!
    # Use callbacks to share common setup or constraints between actions.
    def all_tasks
      @tasks = Task.order(:dl_dt)
      # @tasks = Task.all.sort_by { |task| task.datified_dl }
    end 

    def set_task
      @task = Task.find(params[:id])
    end
    

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:description, :deadline, :dl_dt)
    end
end
