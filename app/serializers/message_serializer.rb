class MessageSerializer < ActiveModel::Serializer
  attributes :id, :body, :user_id, :title
end
