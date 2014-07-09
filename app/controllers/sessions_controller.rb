class SessionsController < ApplicationController

  def new
   @users = User.all
  end

  def create
    @users = User.all
    u = User.find_by_name(params['username'])
    if u && u.authenticate(params['password'])
      session['user_id'] = u.id
    redirect_to "/home"
    else
      redirect_to "/sessions/new", notice: "Sorry wrong password"
    end
  end

  def destroy
    reset_session
    redirect_to "/sessions/new"
  end
end