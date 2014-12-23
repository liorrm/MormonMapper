class CreateTemples < ActiveRecord::Migration

  def change
    create_table :temples do |t|
      t.string   :name
      t.string   :snippet
      t.string   :address
      t.text     :link
      t.decimal  :latitude, precision: 15, scale: 10, default: 0.0
      t.decimal  :longitude, precision: 15, scale: 10, default: 0.0

      t.timestamps
    end
  end

end