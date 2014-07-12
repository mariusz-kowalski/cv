class CreateIdInformations < ActiveRecord::Migration
  def change
    create_table :id_informations do |t|
      t.string :first_name, limit: 90
      t.string :last_name, limit: 90
      t.binary :photo

      t.timestamps
    end
  end
end
