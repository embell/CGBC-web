# Create a Newsletters table
class CreateNewsletters < ActiveRecord::Migration
  def change
    create_table :newsletters do |t|
      t.string :name
      t.date :date
      t.string :file

      t.timestamps
    end
  end
end
