class CreateList < ActiveRecord::Migration
  def change
    create_table :lists, id: false do |t|
      t.references :list_item, null: false, default: 0
      t.references :list_information, null: false, default: 0
      t.integer :ordinal, null: false, default: 0
    end

    add_index :lists, :list_item_id, unique: true
    add_index :lists, :list_information_id
    add_index :lists, [:list_information_id, :ordinal], name: :order_in_lists, unique: true
  end
end
