class AddLastInvoiceToConsigners < ActiveRecord::Migration
  def self.up
    add_column :consigners, :invoice_id, :integer
  end

  def self.down
    remove_column :consigners, :invoice_id
  end
end
