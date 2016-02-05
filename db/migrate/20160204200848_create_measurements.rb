class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.string :host
      t.string :subject
      t.string :layer
      t.string :metric
      t.decimal :value
      t.timestamp :timestamp
    end
  end
end
