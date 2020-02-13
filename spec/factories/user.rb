FactoryGirl.define do
    factory :user do
        email { Faker::Internet.email }
        name { Faker::Name.name }
        address 'Rua joaquin, 560, parque municipio'
        password '123456'
        password_confirmation '123456'
    end
end