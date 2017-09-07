require 'faker'

until Cat.count == 80 do
  cat_hash = {}

  cat_hash[:sex] = %w[M F].sample

  ten_years_ago = Date.new(2007, 1, 1)
  today = Date.today
  cat_hash[:birth_date] = Faker::Date.between(ten_years_ago, today)
  cat_hash[:color] = %w[black orange grey white brown calico].sample

  breed = Faker::Cat.breed
  registry = Faker::Cat.registry
  adjective = %w[cute funny sweet fluffy sassy huggable smelly cuddly smart rabid frenzied street-wise].sample

  loop do
    cat_hash[:name] = Faker::Cat.name + " " + Faker::Name.last_name
    cat_hash[:description] = "#{cat_hash[:name]} is a #{adjective} #{breed} and is registered with #{registry}."
    break if Cat.create(cat_hash)
  end
end
