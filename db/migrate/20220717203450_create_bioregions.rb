class CreateBioregions < ActiveRecord::Migration[7.0]
  def change
    create_table :bioregions, id: :string do |t|
      t.string :title
      t.references :subrealm, type: :string, foreign_key: true, null: false
      t.timestamps
    end
  end
end
