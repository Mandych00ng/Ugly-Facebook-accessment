class CreateFriends < ActiveRecord::Migration
	def change
	create_table :friends do |f|
		f.integer :user_id
		f.integer :friendship_id
		f.timestamps null: false
		end
	end
end
