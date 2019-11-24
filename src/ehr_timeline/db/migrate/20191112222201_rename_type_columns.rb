class RenameTypeColumns < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :type, :event_type
    rename_column :providers, :type, :provider_type
  end
end
