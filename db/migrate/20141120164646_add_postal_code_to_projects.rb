class AddPostalCodeToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :postal_code, :string
  end
end
