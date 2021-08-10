class AddSucessFlgToTestPassage < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :success_flg, :boolean, default: false, null: false
  end
end
