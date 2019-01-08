FactoryBot.define do
  factory :prophet do
    text { "I learned everything in the world!" }
    published_at { Time.zone.now + 1.day }
    published  { false }
    user
  end
end
