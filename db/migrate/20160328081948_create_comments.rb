class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author, :null => false
      t.string :comment, :null => false
      t.belongs_to :links, index: true
    end
  end
end
