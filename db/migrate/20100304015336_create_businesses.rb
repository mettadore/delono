class CreateBusinesses < ActiveRecord::Migration
  def self.up
    create_table :businesses do |t|
      t.string :name
      t.string :street
      t.string :street_2
      t.string :city
      t.string :state
      t.integer :zipcode
      t.string :email
      t.string :website
      t.integer :fax
      t.integer :owner_id
      t.integer :phone
      t.string :subdomain

      t.timestamps
    end
  end

  def self.down
    drop_table :businesses
  end
end
