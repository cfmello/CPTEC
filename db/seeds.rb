# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.destroy_all
# puts 'Creating users...'
# User.create(full_name: 'Cristhiano Mello', email: 'cris@pelomun.do', profile: 'Servant', password: '123456')
# User.create(full_name: 'Adonay Veiga', email: 'adonayveiga@gmail.com', profile: 'Servant', password: '123456')
# User.create(full_name: 'Milena valle', email: 'milenavalle@gmail.com', profile: 'Servant', password: '123456')
# User.create(full_name: 'Felipe Taki', email: 'felipe.takizawa@mj.gov.br', profile: 'Servant', password: '123456')

puts 'Creating experts...'
exp1 = Expert.new(doc_number: '12345678963', phone_number: '321654987', city: 'Curitiba', active: true, accept: 2)
exp1.user = User.find(9)
exp2 = Expert.new(user_id: User.find(10), doc_number: '12345678965', phone_number: '321654987', city: 'Brasilia', active: true, accept: 1)
exp2.user = User.find(10)
exp1.save
exp2.save
puts 'Creating servants...'
serv1 = Servant.new(city: 'Cuiaba', court: 'TJMT')
serv1.user = User.find(11)
serv2 = Servant.new(city: 'Brusque', court: 'TJSC')
serv2.user = User.find(12)
serv1.save
serv2.save
puts 'CRIADA ESSA PORRA!!!!'
