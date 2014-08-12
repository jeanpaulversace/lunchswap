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
    @food = Food.new

    if current_user_session == nil
      redirect_to '/login'
    end

    @foods = Food.where.not(user_id: current_user.id.to_i)
    @user_foods = Food.where(user_id: current_user.id.to_i)

  end

  def update_location
    current_user_id = current_user.id
    user = User.find(current_user_id)

    puts params.inspect

    if user.update_attributes(latitude: params[:latitude], longitude: params[:longitude])
      redirect_to '/user_sessions'
    else
      raise "error"
    end
  end
  
end








