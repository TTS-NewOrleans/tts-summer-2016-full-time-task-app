class UserTasksController < ApplicationController
  before_action :set_user_task, only: [:show, :edit, :update, :destroy]
  before_action :all_tasks, only: [:index, :create, :update, :destroy]

  # GET /user_tasks
  # GET /user_tasks.json
  def index

  end

  # GET /user_tasks/1
  # GET /user_tasks/1.json
  def show
  end

  # GET /user_tasks/new
  def new
    @user_task = UserTask.new
  end

  # GET /user_tasks/1/edit
  def edit
  end

  # POST /user_tasks
  # POST /user_tasks.json
  def create
    @user_task = UserTask.new(user_task_params)

    respond_to do |format|
      if @user_task.save
        format.html { redirect_to @user_task }
        format.js {}
        format.json { render :show, status: :created, location: @user_task }
      else
        format.html { render :new }
        format.js { render :new }
        format.json { render json: @user_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_tasks/1
  # PATCH/PUT /user_tasks/1.json
  def update
    respond_to do |format|
      if @user_task.update(user_task_params)
        format.html { redirect_to @user_task }
        format.js {}
        format.json { render :show, status: :ok, location: @user_task }
      else
        format.html { render :edit }
        format.js { render :edit }
        format.json { render json: @user_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_tasks/1
  # DELETE /user_tasks/1.json
  def destroy
    @user_task.destroy
    respond_to do |format|
      format.html { redirect_to user_tasks_url }
      format.js {}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_task
      @user_task = UserTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_task_params
      params.require(:user_task).permit(:description, :due)
    end

    def all_tasks
      @user_tasks = UserTask.order(:due)
    end
end
