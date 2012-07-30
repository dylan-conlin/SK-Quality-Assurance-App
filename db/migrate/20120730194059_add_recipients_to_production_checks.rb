class AddRecipientsToProductionChecks < ActiveRecord::Migration
  def change
    add_column :production_checks, :recipient_id, :integer
  end
end
