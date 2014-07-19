class AddListInformationTypeToLists < ActiveRecord::Migration
  def change
    add_column :lists, :list_information_type, :string
  end
end
