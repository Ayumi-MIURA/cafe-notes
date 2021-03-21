FactoryBot.define do
  factory :note do
    cafe_name     { '名前' }
    appearance    { '外観' }
    aroma         { '香り' }
    taste         { '味' }
    rich          { 'コク' }
    geography_id  { 1 }
    processing_id { 1 }
    tasting_note  { Faker::Lorem.sentence }
    association :user

    after(:build) do |note|
      note.image.attach(io: File.open('public/images/columbia.jpeg'), filename: 'columbia.jpeg')
    end
  end
end
