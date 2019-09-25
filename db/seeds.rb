KEY_MAPPING = {
  'verticals' => 'vertical_id',
  'categories' => 'category_id'
}
def lowercase(key)
  key = key.downcase
  KEY_MAPPING[key] || key
end

def load_file(path)
  jsons = JSON.parse(File.readlines(path).join(''))
  jsons.map{|json| json.map { |k,v| [lowercase(k),v] }.to_h }
end

verticals_json = load_file('db/seeds_data/verticals.json')
categories_json = load_file('db/seeds_data/categories.json')
courses_json = load_file('db/seeds_data/courses.json')
puts "seeding verticals"
verticals_json.each {|json| Vertical.create!(json) }
puts "seeding categories"
categories_json.each {|json| Category.create!(json) }
puts "seeding courses"
courses_json.each {|json| Course.create!(json) }