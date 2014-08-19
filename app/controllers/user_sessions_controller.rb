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
    @confirmed = []

    confirmed_trades_requestee = Request.where(requestee_user_id: current_user.id.to_s, confirmed: "t")
    unless confirmed_trades_requestee.empty?
      confirmed_trades_requestee.each do |t|
        trade = {}
        trade[:id] = t.id
        trade[:trade_username] = User.find(t.requester_user_id.to_i)
        trade[:trade_phonenumber] = User.find(t.requester_user_id.to_i).phonenumber.to_s.insert(-5,"-").insert(-9,"-")
        @confirmed << trade
      end
    end

    confirmed_trades_requester = Request.where(requester_user_id: current_user.id.to_s, confirmed: "t")
    unless confirmed_trades_requester.empty?
      confirmed_trades_requester.each do |t|
        trade = {}
        trade[:id] = t.id
        trade[:trade_username] = User.find(t.requestee_user_id.to_i)
        trade[:trade_phonenumber] = User.find(t.requestee_user_id.to_i).phonenumber.to_s.insert(-5,"-").insert(-9,"-")
        @confirmed << trade
      end
    end

    puts "THIS IS @CONFIRMED #{@confirmed}"

    user_requests = Request.where(requestee_user_id: current_user.id.to_s, active: "t", confirmed: "f")
    @requests = []
    unless user_requests.empty?
      user_requests.each do |r|
        request = {}
        request[:id] = r.id
        request[:requester_username] = User.find(r.requester_user_id.to_i)
        request[:requester_food] = Food.find(r.requester_food)
        request[:requestee_food] = Food.find(r.requestee_food)
        @requests << request
      end
    end

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








