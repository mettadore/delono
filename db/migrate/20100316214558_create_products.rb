class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :code,   :null => false
      t.string :name
      t.text :description
      t.float :wholesale,   :null => false
      t.float :retail,      :null => false
      t.integer :consigner_id,  :null => false
      t.integer :business_id,   :null => false
      
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
