class CreatePolymorphicRevisions < ActiveRecord::Migration[7.0]
def change
    create_table :revisions do |t|
      t.references :revisable, polymorphic: true, null: false
      t.bigint :user_id, null: false, foreign_key: true
      t.text :description
      t.timestamps
    end
  end
end
