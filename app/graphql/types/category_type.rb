module Types
  class CategoryType < BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :vertical, VerticalType, null: false
  end
end