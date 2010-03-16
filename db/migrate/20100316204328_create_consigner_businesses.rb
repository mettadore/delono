class CreateConsignerBusinesses < ActiveRecord::Migration
  def self.up
    create_table :consigner_businesses do |t|
      t.integer :consigner_id
      t.integer :business_id

      t.timestamps
    end
  end

  def self.down
    drop_table :consigner_businesses
  end
end
