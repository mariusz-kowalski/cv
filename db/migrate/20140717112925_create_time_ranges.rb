class CreateTimeRanges < ActiveRecord::Migration
  def change
    create_table :time_ranges, id: false do |t|
      t.references :time_range_information, null: false, default: 0
      t.date :begin
      t.date :end
    end

    add_index :time_ranges, :time_range_information_id, unique: true
  end
end
