class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.string :host
      t.string :layer
      t.string :subject
      t.string :name
      t.decimal :value
      t.timestamp :timestamp
    end
  end
end
