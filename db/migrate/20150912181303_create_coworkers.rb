class CreateCoworkers < ActiveRecord::Migration
  def change
    create_table :coworkers do |t|
    	t.string :first_name
    	t.string :email
    	t.string :coworker_type
    	t.integer :user_id
    end
  end
end
