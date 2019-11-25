class AddEventIds < ActiveRecord::Migration[6.0]
  def change
    add_column :symptoms, :event_id, :integer
    add_column :procedures, :event_id, :integer
    add_column :prescriptions, :event_id, :integer
  end
end
