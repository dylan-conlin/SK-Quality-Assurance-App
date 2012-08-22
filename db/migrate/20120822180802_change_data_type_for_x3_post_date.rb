class ChangeDataTypeForX3PostDate < ActiveRecord::Migration
  def up
    change_table :nonconformances do |t|
      t.change :x3_post_date, :date
    end
  end

  def down
    change_table :nonconformances do |t|
      t.change :x3_post_date, :datetime
    end
  end
end
