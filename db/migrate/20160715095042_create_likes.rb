class CreateLikes < ActiveRecord::Migration
	def change
		create_table :likes do |t|
			t.integer :user_id
			t.integer :status_id
			t.integer :like 
			t.timestamps
		end	
	end
end
