class AddDefaultToComfortAndInterest < ActiveRecord::Migration
  def up
    change_column_default(:ratings, :comfort, 50)
    change_column_default(:ratings, :interest, 50)
  end
  def down
    change_column_default(:ratings, :comfort, nil)
    change_column_default(:ratings, :interest, nil)
  end
end
