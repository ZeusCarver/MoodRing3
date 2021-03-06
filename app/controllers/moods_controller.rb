class MoodsController < ApplicationController

  def index
    @users = User.all
    @moods = Mood.all
#     @chartData = {}
#     for i in @user.moods
#       key = i.created_at.strftime("%A at %I:%M:%S%p")
#       @chartData[key] = i.level

#     end
  end

  def show
    @users = User.all
    @mood = Mood.find_by(id: params[:id])
  end

  def new
    @users = User.all
  end

  def create
    @users = User.all
    @actions = Action.all
    @mood = Mood.new
    @mood.level = params[:level]
    @mood.user_id = params[:user_id]
    @mood.action_id = params[:action_id]

    if @mood.save
      redirect_to "/users/#{@mood.user_id}"
    else
      render 'new'
    end
  end

  def edit
    @users = User.all
    @mood = Mood.find_by(id: params[:id])
  end

  def update
    @users = User.all
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
    @users = User.all
    @mood = Mood.find_by(id: params[:id])
    @mood.destroy


    redirect_to "/moods"
  end
end
