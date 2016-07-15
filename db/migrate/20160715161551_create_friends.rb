class CreateFriends < ActiveRecord::Migration
	def change
	create_table :friends do |f|
		f.integer :user_id
		f.integer :friendship_id
		f.timestamps null: false
		end
	end
end


# User.all.each do |other_user| 



# Friend.fing_by(user_id: current_user.id , friendship_id: other_user.id)

# p "they are friends "


# end 