FactoryGirl.define do

  factory :name, class: :list_item do
    name 'first name'
    value 'Joe'
    information_type 'name'
  end

  factory :names, class: :list_information do
    name 'names'
    information_type 'names list'

    after(:create) do |list|
      list.list_items.create attributes_for(:name)
      list.list_items.create attributes_for(:name, value: 'John', name: 'middle name')
      list.list_items.create attributes_for(:name, value: 'Yankovitch', name: 'last name')
    end
  end

  factory :phone, class: :basic_information do
    name 'phone no.'
    information_type 'phone no.'
    value '+48 600 666 888'
  end

  factory :email, class: :basic_information do
    name 'email'
    information_type 'email'
    value 'joe@example.com'
  end

  factory :address, class: :basic_information do
    name 'address'
    information_type 'address'
    value "Wall Street 99\n99988 New York\nU.S.A."
  end
end
