class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.bigint :user_id, null: false, foreign_key: true, index: true
      t.string :role, null: false
      t.references :roleable, polymorphic: true, null: false
      t.bigint :set_by, null: false, foreign_key: true
      t.timestamps
    end
    add_index :roles, [:roleable_type, :roleable_id, :role]
  end
end
