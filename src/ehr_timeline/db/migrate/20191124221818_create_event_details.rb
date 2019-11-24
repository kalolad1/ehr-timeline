class CreateEventDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :symptoms do |t|
      t.string :name
      t.integer :priority
    end
    create_table :procedures do |t|
      t.string :name
      t.integer :priority
    end
    create_table :prescriptions do |t|
      t.string :name
      t.integer :priority
    end
  end
end
