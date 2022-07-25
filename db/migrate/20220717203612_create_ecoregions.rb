class CreateEcoregions < ActiveRecord::Migration[7.0]
  def change
    create_table :ecoregions, id: :string do |t|
      t.string :key, unique: true, null: false, index: true
      t.string :title
      t.text :description
      t.timestamps
    end
  end
end
