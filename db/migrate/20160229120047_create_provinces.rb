class CreateProvinces < ActiveRecord::Migration
  def change
    create_table :provinces do |t|
      t.string :name, null: false, unique: true

      t.timestamps null: false
    end
    
    Province.create(name: 'Dolnośląskie')
    Province.create(name: 'Kujawsko-Pomorskie')
    Province.create(name: 'Lubelskie')
    Province.create(name: 'Lubuskie')
    Province.create(name: 'Łódzkie')
    Province.create(name: 'Małopolskie')
    Province.create(name: 'Mazowieckie')
    Province.create(name: 'Opolskie')
    Province.create(name: 'Podkarpackie')
    Province.create(name: 'Podlaskie')
    Province.create(name: 'Pomorskie')
    Province.create(name: 'Śląskie')
    Province.create(name: 'Świętokrzyskie')
    Province.create(name: 'Warmińsko-Mazurskie')
    Province.create(name: 'Wielkopolskie')
    Province.create(name: 'Zachodniopomorskie')
  end
end
