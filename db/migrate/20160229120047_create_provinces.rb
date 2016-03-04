class CreateProvinces < ActiveRecord::Migration
  def change
    create_table :provinces do |t|
      t.string :name, null: false, unique: true

      t.timestamps null: false
    end

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
  end
end
