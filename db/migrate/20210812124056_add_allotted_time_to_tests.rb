class AddAllottedTimeToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :allotted_time, :integer
  end
end
