class User < ApplicationRecord
  has_secure_password

  has_many :chats
  has_many :comments
  has_many :events
  has_many :messages
  has_many :requirements
  has_many :sats, through: :events

  def generate_json_api_error
    json_error = {"errors": []}
    errors.messages.each do |err_type, messages|
      messages.each do |msg|
        json_error[:errors] << {"detail": "#{err_type} #{msg}", "source": {"pointer": "user/err_type"}}
      end
    end
    json_error
  end
end
