class TipsController < ApplicationController

  def index
  end 

  def new
  end 

  def create
    @users = User.all
    @users.each do |user|
      account_sid="ACec1465e23e82ebb1519b72eca9975082"
      auth_token="e643628e4eb71e061742824361139936"
      @client = Twilio::REST::Client.new account_sid, auth_token 
      message = @client.account.messages.create(
        :from => "+14152002640",
        :to => user.phone_number,
        :body => "Hi #{user.first_name}, did you know that school is cool?",
      )
    end 
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


