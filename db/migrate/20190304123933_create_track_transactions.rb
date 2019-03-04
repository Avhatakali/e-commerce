class CreateTrackTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :track_transactions do |t|
      t.references :product, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :price

      t.timestamps
    end
  end
end
