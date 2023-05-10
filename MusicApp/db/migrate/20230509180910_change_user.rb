class ChangeUser < ActiveRecord::Migration[7.0]
  def change
    remove_index :users, :email 
    add_index :users, :email, unique: true

    remove_index :users, :session_token
    add_index :users, :session_token, unique: true
    
  end
end
