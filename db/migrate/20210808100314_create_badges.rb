class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :name, index: true, null: false
      t.string :image, null: false
      t.string :rule, null: false
      t.string :value

      t.timestamps
    end
  end
end
