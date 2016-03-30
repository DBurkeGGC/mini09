class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :linkAddress, :null => false
      t.string :linkAuthor
    end
  end
end
