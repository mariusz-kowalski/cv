module ListConcern
  extend ActiveSupport::Concern

  included do
    has_many :lists, foreign_key: :superinformation_id, dependent: :destroy
    has_many :list_items, through: :lists, dependent: :destroy
  end
end
