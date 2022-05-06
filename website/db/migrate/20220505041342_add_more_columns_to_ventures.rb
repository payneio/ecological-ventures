class AddMoreColumnsToVentures < ActiveRecord::Migration[7.0]
  def change
    add_column :ventures, :discord, :string
    add_column :ventures, :youtube, :string
  end
end
