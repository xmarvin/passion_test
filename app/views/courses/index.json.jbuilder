json.records @courses do |course|
  json.cache! course do
    json.partial! 'course', course: course
  end
end
json.partial! 'shared/pagination', pagination: @courses