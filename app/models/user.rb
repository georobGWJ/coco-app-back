class User < ApplicationRecord
  has_many :applications
  has_many :chats 
  has_many :comments
  has_many :events
  has_many :messages 
  has_many :requirements
  has_many :tips
end