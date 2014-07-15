FactoryGirl.define do
  factory :id_informations do
    id 1
    first_name 'Alan'
  end

  factory :basic_information do
    name 'email'
    information_type 'email'
    value 'alan@machine.com'
    description 'primary email'
  end
end
