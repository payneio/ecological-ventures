class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :linkedin
      t.string :facebook
      t.string :website
      t.string :address
      t.string :country
      t.string :portrait
      t.string :avatar
      t.text :bio
      t.text :interests
      t.boolean :is_public

      t.timestamps
    end
  end
end
