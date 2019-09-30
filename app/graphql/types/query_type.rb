module Types
  class QueryType < Types::BaseObject
    field :all_categories, [CategoryType], null: false, function: Resolvers::CategoriesSearch
    field :all_verticals, [VerticalType], null: false

    def all_categories
      Category.active
    end
    def all_verticals
      Vertical.all
    end
  end
end
