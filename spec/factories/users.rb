FactoryGirl.define do
  factory :user do
    username "test"
    email "test@gmail.com"
    password "password"
    legacy_password "password"
    encrypted_password "password"
  end
end
