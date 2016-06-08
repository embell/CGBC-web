class CreateSermons < ActiveRecord::Migration
  def change
    create_table :sermons do |t|
      t.string :title
      t.string :speaker
      t.date :date
      t.string :audio_file

      t.timestamps
    end
  end
end
