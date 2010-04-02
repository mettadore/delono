class CreateConsigners < ActiveRecord::Migration
  def self.up
    create_table :consigners do |t|
      t.string :name,     :null => false
      t.string :biz_name
      t.string :street
      t.string :street_2
      t.string :city
      t.string :state
      t.integer :zipcode,   :length => 8
      t.integer :phone,     :length => 8
      t.string :email
      t.string :website
      t.integer :fax,       :length => 8
      t.text :notes
      t.date :last_invoiced
      t.integer :percentage,  :null => false, :default => 30

      t.timestamps
    end
  end

  def self.down
    drop_table :consigners
  end
end
