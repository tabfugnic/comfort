class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :authentication_hash

      t.timestamps
    end
  end
end
