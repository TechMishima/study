class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string  :name
      t.text    :memo
      t.integer :position

      t.timestamps
    end
  end
end
