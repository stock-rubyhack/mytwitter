class AddUsernameToUsers < ActiveRecord::Migration
  def change #code inside the def is translated to SQL and the change to db can be rolled back(undo changes)
    add_column :users, :username, :string # add a new column-"username" to table "users". The column is of type "string"
    add_index :users, :username, unique: true # first, index usrnames for quick (rapid) lookup. Second, ensure usernames are ALWAYS unique!
  end
end
