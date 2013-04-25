class Maps < ActiveRecord::Migration
  def up
    create_table :maps do |t|
      t.column :name, :string
      t.column :domain, :string
      t.column :path, :string
      t.timestamps 
    end
  end

  def down
    drop_table :maps
  end
end
