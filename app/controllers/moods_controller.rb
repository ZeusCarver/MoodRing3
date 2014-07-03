class MoodsController < ApplicationController

  def index
    @moods = Mood.all
    @users = User.all
  end

  def show
    @mood = Mood.find_by(id: params[:id])
  end

  def new
  end

  def create
    @mood = Mood.new
    @mood.level = params[:level]
    @mood.user_id = params[:user_id]
    @mood.action_id = params[:action_id]

    if @mood.save
      redirect_to "/moods/#{ @mood.id }"
    else
      render 'new'
    end
  end

  def edit
    @mood = Mood.find_by(id: params[:id])
  end

  def update
    @mood = Mood.find_by(id: params[:id])
    @mood.level = params[:level]
    @mood.user_id = params[:user_id]
    @mood.action_id = params[:action_id]

    if @mood.save
      redirect_to "/moods/#{ @mood.id }"
    else
      render 'edit'
    end
  end

  def destroy
    @mood = Mood.find_by(id: params[:id])
    @mood.destroy


    redirect_to "/moods"
  end
end
