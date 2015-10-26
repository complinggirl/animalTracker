class CreateSightings < ActiveRecord::Migration
  def change
    create_table :sightings do |t|
      t.float :longitude
      t.float :latitude
      t.date :date
      t.integer :animal_id
      t.integer :region_id
      t.timestamps null: false
    end
  end
end
