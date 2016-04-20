class AddRunbookToAlertPolicies < ActiveRecord::Migration
  def change
    add_column :alert_policies, :runbook, :text
  end
end
