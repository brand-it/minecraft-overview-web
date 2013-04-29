class Welcome < ActiveRecord::Migration
  def up
    create_table :welcomes do |t|
      t.timestamps
    end
  end

  def down
    drop_column :welcomes
  end
end
