class ChangeUserTableAgain < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.string :username
      t.string :provider
      t.string :uid
    end
  end

  def down
    change_table :users do |t|
      t.remove :username
      t.remove :provider
      t.remove :uid

    end
  end
end
