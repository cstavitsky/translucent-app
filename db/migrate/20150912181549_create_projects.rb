class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    	t.string :name
    	t.string :status
    	t.string :priority
    	t.integer :user_id
    	t.boolean :completed, default: false
    	t.date :due_date, default: nil
    end
  end
end
