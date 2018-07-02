FactoryBot.define do
  sequence(:email) { |n| "user#{n}@example.com"}

  factory :user do
    email
    password "jacepak"
    first_name "Jace"
    last_name "Pak"
    admin false
  end

  factory :admin, class: User do
    email
    password "johnpak"
    first_name "John"
    last_name "Pak"
    admin true
  end
end
