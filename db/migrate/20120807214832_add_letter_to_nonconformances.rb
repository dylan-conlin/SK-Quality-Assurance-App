class AddLetterToNonconformances < ActiveRecord::Migration
  def change
    add_column :nonconformances, :letter, :text
  end
end
