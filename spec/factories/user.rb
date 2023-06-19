FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    birth_date { Date.new(2000, 1, 1) }
    gender_id { 2 }
  end

  # profile_image に実際の画像ファイルを指定する
  # profile_image { Rack::Test::UploadedFile.new(Rails.root.join('app/assets/images/favorite.png'), 'image/png') }
end
