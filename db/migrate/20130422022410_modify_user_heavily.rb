class ModifyUserHeavily < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.remove :name
      t.remove :authentication_hash
      t.string :first_name
      t.string :last_name
      t.string :avatar
      t.string :email
    end
  end

  def down
    change_table :users do |t|
      t.string :name
      t.string :authentication_hash
      t.remove :first_name
      t.remove :last_name
      t.remove :avatar
      t.remove :email
    end
  end
end
