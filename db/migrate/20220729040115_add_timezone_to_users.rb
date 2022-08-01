class AddTimezoneToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :time_zone, :string, default: "UTC"
    add_column :users, :username, :string, unique: true
    User.all.each do |user|
      user.update(username: user.email.split("@").first)
    end
    change_column :users, :username, :string, unique: true, null: false
    add_index :users, :username, unique: true
  end
end
