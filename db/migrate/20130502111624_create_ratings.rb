class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :topic_id
      t.integer :comfort
      t.integer :interest

      t.timestamps
    end
  end
end
