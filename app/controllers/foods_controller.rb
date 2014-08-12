class FoodsController < ApplicationController

  def add_food
    owner = User.find(current_user.id)

    puts "This is params: #{params}"

    food = Food.new(food_params)

    if food.save
      food.update_attributes(user_id: owner.id, latitude: owner.latitude, longitude: owner.longitude, owner: owner.username)
      redirect_to '/user_sessions'
    else
      raise "error"
    end

  end

  def add_request
  	puts params.inspect
  end

  private 

  def food_params
    params.require(:food).permit(:name, :description)
  end
end
