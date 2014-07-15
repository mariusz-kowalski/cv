class BasicInformationsRenameTypeToInformationType < ActiveRecord::Migration
  def change
    rename_column :basic_informations, :type, :information_type
  end
end
