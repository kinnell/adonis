class AddConfirmableToUsers < ActiveRecord::Migration
  def change

  	change_table(:users) do |t|
            t.confirmable
    end

  	add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    add_index :users, :confirmation_token, :unique => true
    User.update_all(:confirmed_at => Time.now)
  end
end
