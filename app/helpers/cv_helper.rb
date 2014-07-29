module CvHelper
  def address
    BasicInformation.find_by(name: 'address')
  end

  def phone_number
    BasicInformation.find_by(name: 'phone')
  end

  def email
    BasicInformation.find_by(name: 'email')
  end
end
