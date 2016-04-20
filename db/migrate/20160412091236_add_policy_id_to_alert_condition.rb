class AddPolicyIdToAlertCondition < ActiveRecord::Migration
  def change
    add_column :alert_conditions, :policy_id, :integer
  end
end
