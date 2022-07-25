class CreateRealms < ActiveRecord::Migration[7.0]
  def change
    create_table :realms, id: :string do |t|
      t.string :title
      t.timestamps
    end
  end
end
