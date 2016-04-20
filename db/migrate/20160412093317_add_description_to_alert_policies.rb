class AddDescriptionToAlertPolicies < ActiveRecord::Migration
  def change
    add_column :alert_policies, :description, :text
  end
end
