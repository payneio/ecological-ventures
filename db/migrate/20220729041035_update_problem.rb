class UpdateProblem < ActiveRecord::Migration[7.0]
  def change
    remove_column :problems, :description
  end
end
