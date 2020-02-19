FactoryGirl.define do
    factory :user do
        email { Faker::Internet.email }
        name { Faker::Name.name }
        address 'Rua joaquin, 560, parque municipio'
        password '123456'
        password_confirmation '123456'
        phone '999999999'
        city 'Fortaleza'
        escamboos 500
    end
end