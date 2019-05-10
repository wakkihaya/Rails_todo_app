class Api::TasksController < ApplicationController
#@つけるとviewの方で使える。
#get

  def index
    @tasks = Task.order('updated_at DESC')
  end


  #post

  def create
    @task = Task.new(task_params)

    if @task.save
      render :show, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end

  end

  #update
  def update
    @task = Task.find(params[:id]) #idで対応するtaskを探す
    if @task.update(task_params)
      render :show, status: :ok
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  private

  # 新しいtaskのparam設定
  def task_params
    params.fetch(:task,{}).permit(
                              :name, :is_done

    )
  end

end



