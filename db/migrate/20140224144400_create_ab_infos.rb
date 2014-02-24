class CreateAbInfos < ActiveRecord::Migration
  def change
    create_table :ab_infos do |t|
      t.integer :concurrency_num
      t.integer :request_num
      t.integer :response_time
      t.string :url
      t.string :src
      t.string :target

      t.timestamps
    end
  end
end
