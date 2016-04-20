class AddMetricAttributesToConditions < ActiveRecord::Migration
  def change
    add_column :alert_conditions, :host, :string
    add_column :alert_conditions, :layer, :string
    add_column :alert_conditions, :subject, :string
    add_column :alert_conditions, :name, :string
  end
end
