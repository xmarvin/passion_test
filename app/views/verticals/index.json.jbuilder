json.records @verticals do |vertical|
  json.cache! vertical do
    json.partial! 'vertical', vertical: vertical
  end
end
json.partial! 'shared/pagination', pagination: @verticals