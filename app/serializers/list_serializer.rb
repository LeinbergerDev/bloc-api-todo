class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :user_id, :private

  belongs_to :user
  has_many :items
end
