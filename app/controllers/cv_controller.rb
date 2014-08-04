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

    vcard = Vpim::Vcard::Maker.make2 do |maker|
      maker.add_name do |name|
        name.given = names.list_items.first.value
        name.family = names.list_items.last.value
      end
      maker.add_tel @phones.first.value
      maker.add_email @emails.first.value
    end
    # binding.pry
    @qr = RQRCode::QRCode.new(vcard.to_s, size: 6, level: :l)

    respond_to do |format|
      format.html
      format.pdf do
        render(
          pdf: 'file_name',
          layout: 'application.pdf',
          show_as_html: params[:debug].present?
        )
      end
    end
  end
end
