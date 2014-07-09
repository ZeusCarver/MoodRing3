class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def home
    @users = User.all
  end

  def about
    @users = User.all
  end
  def search
      search = params['search']
    if search.present?
      name = User.where("name LIKE '#{search}'")
      mood = Mood.where("level LIKE '#{search}'")
      action = Action.where("description LIKE '#{search}'")
      @users = name
      @moods = mood
      @actions = action

    else
    @moods = Mood.all
    @users = User.all
    @actions = Action.all
    end
  end

end
