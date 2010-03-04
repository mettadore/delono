class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :persistence_token
      t.string :crypted_password
      t.string :password_salt
      t.integer :login_count, :default => 0, :null => false
      t.datetime :last_request_at
      t.datetime :last_login_at
      t.datetime :current_login_at
      t.string :last_login_ip
      t.string :current_login_ip

      t.timestamps
    end
    add_index :users, :login
    add_index :users, :email

  end
  
  def self.down
    drop_table :users
  end
end
