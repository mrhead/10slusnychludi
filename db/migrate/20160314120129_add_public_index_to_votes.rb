class AddPublicIndexToVotes < ActiveRecord::Migration
  def change
    add_index :votes, :public
  end
end
