class CreateBusinesses < ActiveRecord::Migration
  def self.up
    create_table :businesses do |t|
      t.string :name,     :null => false
      t.string :street
      t.string :street_2
      t.string :city
      t.string :state
      t.integer :zipcode,     :limit => 8
      t.string :email
      t.string :website
      t.integer :fax,         :limit => 8
      t.integer :owner_id,     :null => false,  :class_name => "User"
      t.integer :phone,         :limit => 8
      t.string :subdomain,  :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :businesses
  end
end
