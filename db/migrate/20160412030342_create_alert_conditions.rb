class CreateAlertConditions < ActiveRecord::Migration
  def change
    create_table :alert_conditions do |t|
      t.decimal :value, null: false
      t.decimal :warning_threshold
      t.decimal :critical_threshold

      t.string :comparison_operator, limit: 2, null: false

      t.integer :period_type
      t.integer :period_value
      t.integer :period_measurement

      t.timestamps null: false
    end
  end
end
