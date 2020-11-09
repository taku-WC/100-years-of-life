FactoryBot.define do
  factory :user do
    name { "testname"}
    email { "test@test"}
    password {"000000"}
    password_confirmation {"000000"}
    user_level {"1"}
    experience {"0"}
  end
end