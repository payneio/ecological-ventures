class ChangePeopleBioToDescription < ActiveRecord::Migration[7.0]
  def change
    rename_column :people, :bio, :description
  end
end
