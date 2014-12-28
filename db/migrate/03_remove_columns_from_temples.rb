class RemoveColumnsFromTemples < ActiveRecord::Migration
  def change
    remove_column :temples, :open_house_open
    remove_column :temples, :open_house_close
    remove_column :temples, :ordinance_rooms
  end
end

# change column works exactly like add_column, just add integer as the type

# also remove column open houses and ordinance rooms