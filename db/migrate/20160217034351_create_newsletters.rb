# Create a Newsletters table
class CreateNewsletters < ActiveRecord::Migration
  def change
    create_table :newsletters do |t|
      t.string :name
      t.date :date
      t.string :file_path

      t.timestamps
    end
  end
end
