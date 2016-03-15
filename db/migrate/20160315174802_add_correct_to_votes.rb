class AddCorrectToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :correct, :boolean, null: false, default: true
  end
end
