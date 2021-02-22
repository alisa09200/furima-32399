FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname {Faker::Name.name}
    last_name {person.last.kanji}
    first_name {person.first.kanji}
    last_name_kana {person.last.katakana}
    first_name_kana {person.first.katakana}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6, max_length: 20)}
    password_confirmation {password}
    birthday {Faker::Date.birthday}
  end
end