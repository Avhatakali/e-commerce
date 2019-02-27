class AddPurchaseToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :purchase, :boolean, default: false
  end
end
