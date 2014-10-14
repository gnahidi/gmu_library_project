class Book < ActiveRecord::Base
	belongs_to :author

	validates :title, :pages, :genre, presence: true
	
end
