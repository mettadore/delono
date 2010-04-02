class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      t.integer :business_id, :null => false
      t.integer :consigner_id, :null => false
      t.date :date, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :invoices
  end
end
