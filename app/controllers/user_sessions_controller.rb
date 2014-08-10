class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  	render :layout => "users"
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_to '/user_sessions'
    else
      render :action => :new, :layout => "users"
    end
  end

  def destroy
    if current_user_session == nil
      redirect_to '/'
    else
      current_user_session.destroy
      puts "Session has been destroyed: #{current_user_session}"
      redirect_to '/'
    end
  end

  def index
    puts "current_user_session #{current_user_session}"
    puts "Session: #{UserSession.find}"

    if current_user_session == nil
      redirect_to '/login'
    end
  end
end