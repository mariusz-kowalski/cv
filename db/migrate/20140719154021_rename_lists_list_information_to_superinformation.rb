class RenameListsListInformationToSuperinformation < ActiveRecord::Migration
  def change
    rename_column :lists, :list_information_id, :superinformation_id
  end
end
