class Event < ApplicationRecord

	#An event will only ever be one type - a canvas, a phonebank, etc
	belongs_to :event_category

	#Each event belongs to one team - though members of any team can attend any event
	belongs_to :team


	#each event has one creator, which holds a foreign key to a User
	belongs_to :creator, class_name: "User"
	#each event has one lead, which holds a foreign key to a User
	belongs_to :lead, class_name: "User"
	belongs_to :data_captain, :foreign_key => 'data_captain_id',class_name: "User"
	belongs_to :canvas_captain, :foreign_key => 'canvas_captain_id', class_name: "User"
	# belongs_to :data_captain, class_name: "User"
	#An event has many users (guests), but a user can also belong to many events
	has_many :user_events, dependent: :destroy
	has_many :guests, through: :user_events, source: :user
end
