class CreateTransactionTypes < ActiveRecord::Migration
  def self.up
    create_table :transaction_types do |t|
      t.string :noun, :null => false, :uniq => true
      t.string :verb, :null => false, :uniq => true
      t.string :past, :null => false, :uniq => true
      
      t.timestamps
    end
  end

  def self.down
    drop_table :transaction_types
  end
end
