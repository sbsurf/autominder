class CarSerializer < ActiveModel::Serializer
  attributes :id, :name, :year, :make_id, :model_id
end
