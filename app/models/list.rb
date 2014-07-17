class List < ActiveRecord::Base
  self.primary_key = :list_item_id
  
  belongs_to :list_item
  belongs_to :list_information

  validates :ordinal, uniqueness: { scope: :list_information }

  before_validation :next_ordinal, on: :create

  scope :list, ->(list_information){ where(list_information_id: list_information) }

  def update_ordinal new_ordinal
    new_ordinal = new_ordinal.to_i
    return true if new_ordinal == ordinal
    old_ordinal = ordinal
    next_ordinal
    save!
    if new_ordinal < old_ordinal
      range = new_ordinal...old_ordinal
      this_list.where(ordinal: range).order(ordinal: :desc).each do |element| 
        element.update ordinal: element.ordinal + 1
      end
    else
      range = (old_ordinal + 1)..new_ordinal
      this_list.where(ordinal: range).order(ordinal: :asc).each do |element|
        element.update ordinal: element.ordinal - 1
      end
    end
    # binding.pry
    update_attribute :ordinal, new_ordinal
  end

  def this_list
    List.list(list_information_id)
  end

  private

  def next_ordinal
    self.ordinal = ( this_list.maximum(:ordinal) || -1 ) + 1
  end
end
