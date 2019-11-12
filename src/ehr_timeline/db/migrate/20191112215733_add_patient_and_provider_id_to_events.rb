class AddPatientAndProviderIdToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :patient_id, :integer
    add_column :events, :provider_id, :integer
    add_column :events, :note, :string
  end
end
