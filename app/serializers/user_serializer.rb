class UserSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :email, :password

  has_many :lists
end
