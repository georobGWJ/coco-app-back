class TipJob < ApplicationJob
  queue_as :default

  def perform(args = {})
    @phone_number = args[:phone_number]
    @name = args[:name]
    @content = args[:content]
    p "*******" * 100
    account_sid="ACec1465e23e82ebb1519b72eca9975082"
    auth_token="e643628e4eb71e061742824361139936"
    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.account.messages.create(
      :from => "+14152002640",
      :to => @phone_number,
      :body => "Hi #{@name}, #{@content}"
    )
  end
end
