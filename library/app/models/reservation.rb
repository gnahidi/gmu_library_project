class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :book

	before_create do |reservation|

		reservation.reserved_on = DateTime.now
		reservation.due_on = DateTime.now  + 7.days
	end

	
end
