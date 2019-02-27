class AddStatusToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :status, :integer ,default: buyer
  end
end
