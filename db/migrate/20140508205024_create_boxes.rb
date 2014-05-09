class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.string :content
      t.integer :user_id # TODO add dishes/components! 
      t.date :date

      t.timestamps
    end
    add_index :boxes, [:user_id, :date]
  end
end
