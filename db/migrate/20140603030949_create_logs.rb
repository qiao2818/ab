class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :concurrency_num
      t.integer :request_num
      t.string :start_date
      t.string :end_date
      t.string :src
      t.string :target
      t.integer :url_id

      t.timestamps
    end
  end
end
