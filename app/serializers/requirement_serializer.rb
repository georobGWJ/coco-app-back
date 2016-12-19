class RequirementSerializer < ActiveModel::Serializer
  attributes :id, :subject, :years, :user_id
end
