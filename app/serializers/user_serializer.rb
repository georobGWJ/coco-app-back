class UserSerializer < ActiveModel::Serializer
  attributes :id, :user_type, :first_name, :last_name, :email, :phone_number, :street_address, :city, :state, :zip_code, :lang_preference, :grade_level

end
