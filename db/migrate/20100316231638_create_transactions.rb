class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.integer :business_id, :null => false
      t.integer :product_id, :null => false
      t.integer :transaction_type_id, :null => false, :default => 1
      t.float :wholesale, :null => false
      t.float :retail, :null => false
      t.integer :invoice_id, :null => false, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
