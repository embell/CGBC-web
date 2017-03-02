class ChangeEventDateColumns < ActiveRecord::Migration
  def change
    rename_column :events, :date, :start_date
    rename_column :events, :time, :start_time
    
    add_column :events, :end_date, :date
    add_column :events, :end_time, :time
  end
end
