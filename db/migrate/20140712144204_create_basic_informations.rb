class CreateBasicInformations < ActiveRecord::Migration
  def change
    create_table :basic_informations do |t|
      t.string :name, limit: 60
      t.string :type, limit: 60
      t.string :value, limit: 256
      t.string :description, limit: 256

      t.timestamps
    end
  end
end
