# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all #this is default, active record
cat1 = Cat.create(birth_date: '2012/01/20', color: 'grey', name: "A", sex: "M", description: "cat")
cat2 = Cat.create(birth_date: '2016/01/20', color: 'yellow', name: "B", sex: "M", description: "cat")
cat3 = Cat.create(birth_date: '2000/01/20', color: 'red', name: "C", sex: "M", description: "cat")
cat4 = Cat.create(birth_date: '2009/01/20', color: 'black', name: "D", sex: "F", description: "cat")
cat5 = Cat.create(birth_date: '2005/01/20', color: 'black', name: "E", sex: "F", description: "cat")
cat6 = Cat.create(birth_date: '2008/01/20', color: 'yellow', name: "F", sex: "F", description: "cat")
