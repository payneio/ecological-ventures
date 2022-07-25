class AddDescriptionToBioregion < ActiveRecord::Migration[7.0]
  def change
    add_column :bioregions, :description, :text
  end
end
