class ActionsController < ApplicationController

  def index
    @actions = Action.all
  end

  def show
    @action = Action.find_by(id: params[:id])
  end

  def new
  end

  def create
    @action = Action.new
    @action.description = params[:description]
    @action.user_id = params[:user_id]

    if @action.save
      redirect_to "/actions/#{ @action.id }"
    else
      render 'new'
    end
  end

  def edit
    @action = Action.find_by(id: params[:id])
  end

  def update
    @action = Action.find_by(id: params[:id])
    @action.description = params[:description]
    @action.user_id = params[:user_id]

    if @action.save
      redirect_to "/actions/#{ @action.id }"
    else
      render 'edit'
    end
  end

  def destroy
    @action = Action.find_by(id: params[:id])
    @action.destroy


    redirect_to "/actions"
  end
end
