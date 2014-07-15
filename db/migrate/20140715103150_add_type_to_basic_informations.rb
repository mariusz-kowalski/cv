class AddTypeToBasicInformations < ActiveRecord::Migration
  def change
    add_column :basic_informations, :type, :string, limit: 60
  end
end
