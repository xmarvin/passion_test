require 'search_object/plugin/graphql'

class Resolvers::CategoriesSearch
  # include SearchObject for GraphQL
  include SearchObject.module(:graphql)

  # scope is starting point for search
  scope { object.categories }

  type types[Types::CategoryType]

  # inline input type definition for the advance filter
  class CategoryFilter < ::Types::BaseInputObject
    argument :OR, [self], required: false
    argument :name_contains, String, required: false
  end

  # when "filter" is passed "apply_filter" would be called to narrow the scope
  #option :filter, type: CategoryFilter, with: :apply_filter
  option :first, type: types.Int, with: :apply_first

  def apply_first(scope, value)
    scope.limit(value)
  end

  def apply_filter(scope, value)
    branches = normalize_filters(value).reduce { |a, b| a.or(b) }
    scope.merge branches
  end

  def normalize_filters(value, branches = [])
    scope = Category.all
    scope = scope.where('name LIKE ?', "%#{value[:name_contains]}%") if value[:name_contains]
    branches << scope

    value[:OR].reduce(branches) { |s, v| normalize_filters(v, s) } if value[:OR].present?

    branches
  end
end