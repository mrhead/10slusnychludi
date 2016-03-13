class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :name
      t.string :city
      t.string :email
      t.boolean :public

      t.timestamps null: false
    end
  end
end
