class AddCityToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :city, :string
  end
end
