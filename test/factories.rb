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

  factory :programing_languages, class: :list_information do
    name 'skills list'
    information_type 'list'
    value 'programing languages'
    description 'programing languages'
  end

  factory :ruby, class: :list_item do
    name 'ruby'
    information_type 'skill'
    value '5'
    description '2 years of professional experience'
    association :superinformation, factory: :programing_languages
  end

  factory :languages, class: :list_information do
    name 'languages'
    information_type 'skills'
    value 'languages'
    description 'knowing of languages'

    after(:create) do |list_information|
      list_information.list_items.create name: 'polish', value: '5'
      list_information.list_items.create name: 'english', value: '4'
      list_information.list_items.create name: 'spanish', value: '2'
      list_information.list_items.create name: 'german', value: '1'
      list_information.list_items.create name: 'russian', value: '1'
    end
  end

  factory :languages_random_order, class: :list_information do
    name 'languages'
    information_type 'skills'
    value 'languages'
    description 'knowing of languages'

    after(:create) do |list_information|
      polish = list_information.list_items.create name: 'polish', value: '5'
      english = list_information.list_items.create name: 'english', value: '4'
      spanish = list_information.list_items.create name: 'spanish', value: '2'
      german = list_information.list_items.create name: 'german', value: '1'
      russian = list_information.list_items.create name: 'russian', value: '1'

      russian.list.update_ordinal 0
      spanish.reload.list.update_ordinal 1
      german.reload.list.update_ordinal 2
      english.reload.list.update_ordinal 3
      polish.reload.list.update_ordinal 4
    end
  end

  factory :university, class: :time_range_information do
    name 'University of Wrocław'
    information_type 'education'
    value 'Physics Sience'
    description 'Theoretical Physics'
  end

  factory :university_krakow, class: :time_range_information do
    name 'University of Kraków'
    information_type 'education'
    value 'Physics Sience'
    description 'Theoretical Physics'
    after(:create) do |information|
      information.create_time_range(
        :begin => '01/01/2000', 
        :end => '01/01/2005', 
        :information => information)
    end
  end

  factory :university_wroclaw, class: :time_range_information do
    name 'University of Wroclaw'
    information_type 'education'
    value 'Physics Sience'
    description 'Theoretical Physics'
    after(:create) do |information|
      information.create_time_range(
        :begin => '01/01/2000', 
        :end => nil, 
        :information => information)
    end
  end

  factory :university_torun, class: :time_range_information do
    name 'University of Torun'
    information_type 'education'
    value 'Physics Sience'
    description 'Theoretical Physics'
    after(:create) do |information|
      information.create_time_range(
        :begin => '01/01/1998', 
        :end => '01/01/1999', 
        :information => information)
    end
  end

  factory :university_gdansk, class: :time_range_information do
    name 'University of Gdansk'
    information_type 'education'
    value 'Physics Sience'
    description 'Theoretical Physics'
    after(:create) do |information|
      information.create_time_range(
        :begin => '01/01/1997', 
        :end => '01/01/1999', 
        :information => information)
    end
  end

  factory :work_place_A, class: :time_range_list_information do
    name 'place A'
    information_type 'employment'
    value 'application administrator'
    description 'http://example.com'
  end

  factory :sys_admin, class: :list_item do
    name 'sys admin'
    information_type 'role'
    value 'Debian, Centos'
    description 'web application servers, baskup'
    association :superinformation, factory: :work_place_A
  end

  factory :work_place_B, class: :time_range_list_information do
    name 'place B'
    information_type 'employment'
    value 'application administrator'
    description 'http://example.com'
    after(:create) do |information|
      information.create_time_range(
        :begin => '01/01/2000', 
        :end => '01/01/2005', 
        :information => information
      )
    end
  end
end
