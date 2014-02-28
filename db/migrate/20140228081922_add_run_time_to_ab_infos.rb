class AddRunTimeToAbInfos < ActiveRecord::Migration
  def change
    add_column :ab_infos, :run_time, :timestamp
  end
end
