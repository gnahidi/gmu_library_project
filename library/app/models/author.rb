class Author < ActiveRecord::Base

  has_many :books, dependent: :restrict_with_exception

  validates :name, :dob, :nationality, :biography, :image_url, presence: true
  validates :biography, length: { minimum: 15 }, unless: 'biography.blank?'

#  validates :name, :presence => true, allow_blank: false

end

