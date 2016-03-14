class AddIpToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :ip, :string, null: false, default: ''
  end
end
