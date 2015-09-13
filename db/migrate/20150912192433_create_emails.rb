class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
    	t.integer :sender_id
    	t.integer :recipient_id
    	t.string :subject_line_beginning_week
    	t.string :subject_line_end_week
    	t.string :addressee_name
    	t.string :addressee_email
        t.string :projects
    end
  end
end
