class Book < ActiveRecord::Base
	belongs_to :author

	validates :isbn, :title, :genre, :abstract, :pages, :published_on, :total_in_library, presence: true
	
	validates :pages,
		numericality: {only_integer: true, greater_than_or_equal_to: 0},
		unless: "pages.blank?"
	
	validates :total_in_library,
		numericality: {only_integer: true, greater_than_or_equal_to: 0},
		unless: "total_in_library.blank?"
	
	validates :abstract, length: {minimum: 15 }, unless: 'abstract.blank?'
  
end
