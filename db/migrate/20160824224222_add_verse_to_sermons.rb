class AddVerseToSermons < ActiveRecord::Migration
  def change
    add_column :sermons, :verses, :string
  end
end
