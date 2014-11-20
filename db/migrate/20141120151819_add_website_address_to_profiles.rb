class AddWebsiteAddressToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :website_address, :string
  end
end
