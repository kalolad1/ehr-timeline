class AddIsIncluded < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :is_included, :boolean
  end
end
