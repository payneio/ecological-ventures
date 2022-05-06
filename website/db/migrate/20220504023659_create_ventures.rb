class CreateVentures < ActiveRecord::Migration[7.0]
  def change
    create_table :ventures do |t|
      t.string :name
      t.text :description
      t.string :logo
      t.integer :org_size
      t.integer :year_started
      t.string :status
      t.string :labels

      t.timestamps
    end
  end
end
