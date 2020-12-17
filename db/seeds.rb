require 'csv'
require 'json'
require 'open-uri'

# Expert.destroy_all
# Servant.destroy_all
# User.destroy_all
# puts 'Creating users...'
# User.create(full_name: 'Cristhiano Mello', email: 'cris@pelomun.do', profile: '1', password: '123456')
# User.create(full_name: 'Adonay Veiga', email: 'adonayveiga@gmail.com', profile: '1', password: '123456')
# User.create(full_name: 'Milena valle', email: 'milenavalle@gmail.com', profile: '2', password: '123456')
# User.create(full_name: 'Felipe Taki', email: 'felipe.takizawa@mj.gov.br', profile: '3', password: '123456')

# users = User.all

puts 'Creating experts...'
# exp1 = Expert.new(doc_number: '12345678963', phone_number: '321654987', city: 'Curitiba', distance: 200, curriculum: 'http://lattes.cnpq.br/980688156015236', active: true, accept: 2)
# exp1.user = users[0]
# exp2 = Expert.new(doc_number: '12345678965', phone_number: '321654987', city: 'Brasilia', distance: 200, curriculum: 'http://lattes.cnpq.br/985688156015236', active: true, accept: 1)
# exp2.user = users[1]
# exp1.save
# exp2.save
areas=[]
options = { col_sep: ';', headers: :first_row, encoding: Encoding::ISO_8859_1 }
CSV.foreach('app/assets/CBO2002 - Ocupacao.csv', options) do |row|
  areas << row['TITULO']
end
cities = JSON.parse(open('https://servicodados.ibge.gov.br/api/v1/localidades/municipios').read)
             .map { |item| "#{item['microrregiao']['mesorregiao']['UF']['sigla']} - #{item['nome']}" }
10.times do
  fake_user = User.create(
    full_name: Faker::Name.name,
    email: Faker::Internet.safe_email,
    profile: '1',
    password: '123456'
  )
  fake_exp = Expert.create!(
    doc_number: rand(10000000000..99999999999),
    phone_number: rand(911110000..999999999),
    city: cities.sample,
    accept: rand(0..2),
    distance: rand(20..500),
    user: fake_user,
    curriculum: "http://lattes.cnpq.br/#{rand(911110000..999999999)}"
  )
  print '.'
  5.times do
    Field.create!(area: areas.sample, expert: fake_exp)
  end
end
# puts 'Creating servants...'
# serv1 = Servant.new(city: 'Cuiaba', court: 'TJMT')
# serv1.user = users[2]
# serv2 = Servant.new(city: 'Brusque', court: 'TJSC')
# serv2.user = users[3]
# serv1.save
# serv2.save
puts 'CRIADA ESSA PORRA!!!!'
