FactoryBot.define do
  factory :user do
    nickname { 'test' }
    email { 'test@test123' }
    password { 'test12' }
    first_name { '田中' }
    last_name { '太郎' }
    first_name_kana { 'タナカ' }
    last_name_kana { 'タロウ' }
    birth_date { '1930-03-03' }
  end
end
