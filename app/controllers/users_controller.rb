class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @users = User.all
    @user = User.find_by(id: params[:id])
    @chartData = {}
    for i in @user.moods
      key = i.created_at.strftime("%A at %I:%M:%S%p")
      @chartData[key] = i.level
    end
    # @chartData = {Alex: 5, Frank: 8, "Lisa"=>nil, "Martha"=>nil, "Olga"=>nil, "Willy"=>nil}
    # @chartData["Alex"] = 5
  end

  def new
    @users = User.all
  end

  def create
    @users = User.all
    @user = User.new
    @user.name = params[:name]
    @user.email = params[:email]

    if @user.save
      redirect_to "/users/#{ @user.id }"
    else
      render 'new'
    end
  end

  def edit
    @users = User.all
    @user = User.find_by(id: params[:id])
  end

  def update
    @users = User.all
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]

    if @user.save
      redirect_to "/users/#{ @user.id }"
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy


    redirect_to "/users"
  end
end
