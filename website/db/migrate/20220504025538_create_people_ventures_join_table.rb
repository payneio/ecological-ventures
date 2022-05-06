class CreatePeopleVenturesJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :people, :ventures do |t|
      t.index :person_id
      t.index :venture_id
    end
  end
end
