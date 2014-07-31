class CvController < ApplicationController
  def index
    names = ListInformation.find_by(name: :names)
    @names = names && names.list_items.map(&:value).join(' ')
    
    @phones = BasicInformation.where(information_type: 'phone no.')
    @emails = BasicInformation.where(information_type: 'email')
    @address = BasicInformation.find_by(name: 'address')

    @employments = TimeRangeListInformation.where(information_type: 'employment')

    @skills = ListInformation.where(information_type: 'skills')

    @educations = TimeRangeInformation.where(information_type: 'education')

    @hobbies = ListInformation.find_by(information_type: 'hobbies')

    @links = ListInformation.find_by(information_type: 'links')
  end
end
