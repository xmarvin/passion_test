module Types
  class VerticalType < BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :categories, [Types::CategoryType], null: false, function: Resolvers::CategoriesSearch
  end
end