class AddDetailsToTemples < ActiveRecord::Migration
  def change
    add_column :temples, :announcement,     :date
    add_column :temples, :groundbreaking,   :date
    add_column :temples, :site_dedicator,   :string
    add_column :temples, :open_house_open,  :date
    add_column :temples, :open_house_close, :date
    add_column :temples, :dedication,       :date
    add_column :temples, :dedicator,        :string
    add_column :temples, :site,             :string
    add_column :temples, :exterior_finish,  :string
    add_column :temples, :ordinance_rooms,  :string
    add_column :temples, :total_floor_area, :string
  end
end

# change column works exactly like add_column, just add integer as the type

# also remove column open houses and ordinance rooms