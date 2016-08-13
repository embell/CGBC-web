class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.text :text
      t.date :date

      t.timestamps
    end
  end
end
