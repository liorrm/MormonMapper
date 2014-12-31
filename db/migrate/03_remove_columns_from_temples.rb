class RemoveColumnsFromTemples < ActiveRecord::Migration
  def change
    remove_column :temples, :open_house_open
    remove_column :temples, :open_house_close
    remove_column :temples, :ordinance_rooms
  end
end
