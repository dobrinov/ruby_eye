class CreateAlertPolicies < ActiveRecord::Migration
  def change
    create_table :alert_policies do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
