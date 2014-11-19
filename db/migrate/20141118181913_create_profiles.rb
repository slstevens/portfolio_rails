class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.text :description
      t.string :address
      t.float :longitude
      t.float :latitude

      t.timestamps null: false
    end
  end
end
