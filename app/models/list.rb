class List < ActiveRecord::Base
  self.primary_key = :list_item_id
  
  belongs_to :list_item
  belongs_to :superinformation, class_name: :BasicInformation

  validates :ordinal, uniqueness: { scope: :superinformation }

  before_validation :next_ordinal, on: :create
  after_destroy ->(record){ order_after_destroy record }

  scope :list, ->(superinformation){ where(superinformation_id: superinformation) }

  def update_ordinal new_ordinal
    new_ordinal = new_ordinal.to_i
    return true if new_ordinal == ordinal
    old_ordinal = ordinal
    # binding.pry
    next_ordinal
    save!
    if new_ordinal < old_ordinal
      range = new_ordinal...old_ordinal
      this_list.where(ordinal: range).order(ordinal: :desc).each do |element| 
        element.update! ordinal: element.ordinal + 1
      end
    else
      range = (old_ordinal + 1)..new_ordinal
      this_list.where(ordinal: range).order(ordinal: :asc).each do |element|
        element.update! ordinal: element.ordinal - 1
      end
    end
    update! ordinal: new_ordinal
    # binding.pry
  end

  def order_after_destroy record
    this_list.where("ordinal > ?", record.ordinal).each do |element|
      element.update! ordinal: element.ordinal - 1
    end
  end

  def this_list
    List.list(superinformation_id)
  end

  private

  def next_ordinal
    self.ordinal = ( this_list.maximum(:ordinal) || -1 ) + 1
  end
end
