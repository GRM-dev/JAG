# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

Province.create(name: 'Dolnoslaskie')
Province.create(name: 'Kujawsko-Pomorskie')
Province.create(name: 'Lubelskie')
Province.create(name: 'Lubuskie')
Province.create(name: 'Lodzkie')
Province.create(name: 'Malopolskie')
Province.create(name: 'Mazowieckie')
Province.create(name: 'Opolskie')
Province.create(name: 'Podkarpackie')
Province.create(name: 'Podlaskie')
Province.create(name: 'Pomorskie')
Province.create(name: 'Slaskie')
Province.create(name: 'Swietokrzyskie')
Province.create(name: 'Warminsko-Mazurskie')
Province.create(name: 'Wielkopolskie')
Province.create(name: 'Zachodniopomorskie')

comp1 = Faker::Company.name
jc1 = Faker::Company.profession
city1 = Faker::Address.city
s1 = Faker::Internet.domain_name
comp2 = Faker::Company.name
jc2 = Faker::Company.profession
city2 = Faker::Address.city
s2 = Faker::Internet.domain_name

Company.create(name: comp1)
JobCategory.create(name: jc1)
City.create(name: city1, province: Province.find(Faker::Number.between(1,16)))
Site.create(name: s1)

Company.create(name: comp2)
JobCategory.create(name: jc2)
City.create(name: city2, province: Province.find(Faker::Number.between(1,16)))
Site.create(name: s2, url: 'http://www.'+s2)

Advert.create(company: Company.find_by_name(comp1), job_category: JobCategory.find_by_name(jc1),
              city: City.find_by_name(city1), appointment: Faker::Company.profession,
              url: Faker::Internet.url('jobs.advjobsfinder.pl'), site: Site.find_by_name(s1),
              date_adv_added: Faker::Date.between(200.days.ago, Date.today),
              date_adv_link_added: Faker::Date.between(20.days.ago, Date.today),
              date_expiration: Faker::Date.forward(230))

Advert.create(company: Company.find_by_name(comp2), job_category: JobCategory.find_by_name(jc2),
              city: City.find_by_name(city2), appointment: Faker::Company.profession,
              url: Faker::Internet.url('jobs.advjobs.pl'), site: Site.find_by_name(s2),
              date_adv_added: Faker::Date.between(200.days.ago, Date.today),
              date_adv_link_added: Faker::Date.between(20.days.ago, Date.today),
              date_expiration: Faker::Date.forward(230))
