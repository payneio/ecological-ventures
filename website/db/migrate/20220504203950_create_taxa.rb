class CreateTaxa < ActiveRecord::Migration[7.0]
  def change
    create_table :taxa do |t|
      t.string :name
      t.text :description
      t.string :link
      t.string :cover_photo

      t.timestamps
    end
  end
end
