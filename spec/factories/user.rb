FactoryGirl.define do

  factory :user do
    first_name "Boris"
    last_name "Spider"
    password "secret123"
    password_confirmation { password }
    admin false
  end

end