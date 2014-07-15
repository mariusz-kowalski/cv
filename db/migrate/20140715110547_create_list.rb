class CreateList < ActiveRecord::Migration
  def change
    create_table :lists, id: false do |t|
      t.references :list_item
      t.references :list_information
    end

    add_index :lists, :list_item_id, unique: true
    add_index :lists, :list_information_id
  end
end
