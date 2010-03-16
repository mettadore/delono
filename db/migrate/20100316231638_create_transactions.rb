class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.integer :business_id
      t.integer :product_id
      t.integer :transaction_type_id
      t.float :wholesale
      t.float :retail

      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
