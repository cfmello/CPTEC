# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Expert.destroy_all
Servant.destroy_all
User.destroy_all
puts 'Creating users...'
User.create(full_name: 'Cristhiano Mello', email: 'cris@pelomun.do', profile: '1', password: '123456')
User.create(full_name: 'Adonay Veiga', email: 'adonayveiga@gmail.com', profile: '1', password: '123456')
User.create(full_name: 'Milena valle', email: 'milenavalle@gmail.com', profile: '2', password: '123456')
User.create(full_name: 'Felipe Taki', email: 'felipe.takizawa@mj.gov.br', profile: '3', password: '123456')

users = User.all

puts 'Creating experts...'
exp1 = Expert.new(doc_number: '12345678963', phone_number: '321654987', city: 'Curitiba', active: true, accept: 2)
exp1.user = users[0]
exp2 = Expert.new(doc_number: '12345678965', phone_number: '321654987', city: 'Brasilia', active: true, accept: 1)
exp2.user = users[1]
exp1.save
exp2.save
puts 'Creating servants...'
serv1 = Servant.new(city: 'Cuiaba', court: 'TJMT')
serv1.user = users[2]
serv2 = Servant.new(city: 'Brusque', court: 'TJSC')
serv2.user = users[3]
serv1.save
serv2.save
puts 'CRIADA ESSA PORRA!!!!'
