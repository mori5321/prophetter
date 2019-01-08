FactoryBot.define do
  factory :user do
    provider  { "Twitter" }
    uid       { SecureRandom.hex(12) }
    name      { "Daisuke" }
    access_token { "aaaaaaaaaaaaa" }
    access_token_secret { "aaaaaaaaaaaaa" }
    screen_name { "moris5321" }
  end
end
