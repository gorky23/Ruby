class CreateZoos < ActiveRecord::Migration[7.0]
  def change
    create_table :zoos do |t|

      t.timestamps
    end
  end
end
