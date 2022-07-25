class AddSummaryAndLinkColumnsToVentures < ActiveRecord::Migration[7.0]
  def change
    add_column :ventures, :summary, :string
    add_column :ventures, :link, :string
  end
end
