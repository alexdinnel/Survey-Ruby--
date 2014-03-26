class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.column :question, :string
      t.column :survey, :string

      t.timestamps
    end
  end
end
