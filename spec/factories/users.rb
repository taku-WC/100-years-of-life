FactoryBot.define do
  factory :user do
    name { "testname"}
    email { "test@test"}
    password {"000000"}
    password_confirmation {"000000"}
  end
end