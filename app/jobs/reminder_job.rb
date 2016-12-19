class ReminderJob < ApplicationJob
  queue_as :default

  def perform(args = {})
    @name = args[:name]
    @phone_number = args[:phone_number]
    @date = args[:date]
    @location = args[:location]
    account_sid="ACec1465e23e82ebb1519b72eca9975082"
    auth_token="e643628e4eb71e061742824361139936"
    @client = Twilio::REST::Client.new account_sid, auth_token 
    message = @client.account.messages.create(
      :from => "+14152002640",
      :to => @phone_number,
      :body => "Hi #{@name}, you have an SAT test coming up on #{@date} at #{@location}",
    )
  end
end
