class BioregionEcoregion < ActiveRecord::Migration[7.0]
  def change
    create_table :bioregions_ecoregions do |t|
      t.references :bioregion, null: false, foreign_key: true, type: :string
      t.references :ecoregion, null: false, foreign_key: true, type: :string
      t.timestamps
    end
  end
end
