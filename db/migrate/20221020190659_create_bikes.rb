class CreateBikes < ActiveRecord::Migration[7.0]
  def change
    create_table :bikes do |t|
      t.string :first_part
      t.string :second_part
      t.string :third_part

      t.timestamps
    end
  end
end
