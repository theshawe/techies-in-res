class AddAttributesToPin < ActiveRecord::Migration
  def change
    add_column :pins, :mood, :string
  end
end
