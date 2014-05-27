class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :email, :null => false
      # t.string :password_digest, :null => false # for use with newest BCrypt `has_secure_password` method
      t.string :password_hash, :null => false
      t.timestamps
    end
    add_index :users, :email, :unique => true
  end
end
