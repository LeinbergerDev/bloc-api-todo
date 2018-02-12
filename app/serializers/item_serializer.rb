class ItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :checked, :list_id

  belongs_to :list
end
