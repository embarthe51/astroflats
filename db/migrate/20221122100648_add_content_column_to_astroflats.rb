class AddContentColumnToAstroflats < ActiveRecord::Migration[7.0]
  def change
    add_column :astroflats, :content, :text
  end
end
