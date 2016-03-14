class ChangeDefaultPublicValue < ActiveRecord::Migration
  def up
    change_column :votes, :public, :boolean, default: true
  end

  def down
    change_column :votes, :public, :boolean, default: false
  end
end
