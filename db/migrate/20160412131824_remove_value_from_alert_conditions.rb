class RemoveValueFromAlertConditions < ActiveRecord::Migration
  def change
    remove_column :alert_conditions, :value
  end
end
