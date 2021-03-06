class AddPercentWeightChangeToUsers < ActiveRecord::Migration
  	class ::User < ActiveRecord::Base
  	end

  	class ::Weighin < ActiveRecord::Base
  	end

	def change
  		add_column :users, :percentWeightChange, :float, default: 0, null: false

  		User.all.each do |u|
  			u.update_attribute(:percentWeightChange, (if u.hasWeighins? then (100*(u.currentWeight-u.firstWeight).to_f/u.firstWeight.to_f.round(2)).round(2) else 0 end))
  			u.save!
  		end

  	end

end
