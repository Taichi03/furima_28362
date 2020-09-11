FactoryBot.define do
  factory :user do
    nickname { 'test' }
    email { 'test@test' }
    password { 'test12' }
    first_name { '田中' }
    last_name { '太郎' }
    first_name_kana { 'たなか' }
    last_name_kana { 'たろう' }
    birth_date { '1930' }
  end
end
