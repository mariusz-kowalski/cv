class RenameTimeRangesTimeRangeInformationIdToInformationId < ActiveRecord::Migration
  def change
    rename_column :time_ranges, :time_range_information_id, :information_id
  end
end
