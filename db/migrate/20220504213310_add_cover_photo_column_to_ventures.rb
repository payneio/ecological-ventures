class AddCoverPhotoColumnToVentures < ActiveRecord::Migration[7.0]
  def change
    add_column :ventures, :cover_photo, :string
  end
end
