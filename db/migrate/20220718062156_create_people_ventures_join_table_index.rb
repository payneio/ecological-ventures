class CreatePeopleVenturesJoinTableIndex < ActiveRecord::Migration[7.0]
  def change
    add_index :people_ventures, [:person_id, :venture_id], unique: true
  end
end
