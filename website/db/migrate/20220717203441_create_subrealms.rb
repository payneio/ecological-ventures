class CreateSubrealms < ActiveRecord::Migration[7.0]
  def change
    create_table :subrealms, id: :string do |t|
      t.string :title
      t.references :realm, type: :string, foreign_key: true, null: false
      t.timestamps
    end
  end

end
