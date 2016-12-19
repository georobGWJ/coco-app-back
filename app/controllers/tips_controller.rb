class TipsController < ApplicationController

  def index
    @users = User.all
    @tips = Tip.all
    i = 0
    @tips.each do |tip|
        i += 1
      @users.each do |user|
        tip_information = {
          phone_number: user.phone_number, 
          name: user.name,
          content: tip.content
        } 
        TipJob.set(wait: i.weeks).perform_later(tip_information)
      end 
    end 
  end 

  def new
  end 

  def create
  end 

  def show 
  end

  def edit
  end 

  def update
  end 

  def destroy
  end  

end





# grab all the user's phone numbers and first name 
# grab a list of our tip objects 
# iterate through user's list and take one tip object 
# send that tip to their phone number
# repeat once a week 


