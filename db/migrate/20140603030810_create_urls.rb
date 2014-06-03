class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :url
      t.integer :enable
      t.integer :need_date

      t.timestamps
    end
  end
end
