FactoryGirl.define do
  factory :product do
    name 'Samsung'
    description { Faker::Lorem.paragraph }
    escamboos 500
    category 'Eletronic'
    user
  end
end