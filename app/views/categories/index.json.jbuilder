json.records @categories do |category|
  json.cache! category do
    json.partial! 'category', category: category
  end
end
json.partial! 'shared/pagination', pagination: @categories