class ActionsController < ApplicationController

  def index
    @users = User.all
    @actions = Action.all
  end

  def show
    @users = User.all
    @action = Action.find_by(id: params[:id])
  end

  def new
    @users = User.all
  end

  def create
    @users = User.all
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
    @users = User.all
    @action = Action.find_by(id: params[:id])
  end

  def update
    @users = User.all
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
    @users = User.all
    @action = Action.find_by(id: params[:id])
    @action.destroy


    redirect_to "/actions"
  end
end
