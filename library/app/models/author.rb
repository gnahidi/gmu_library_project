class Author < ActiveRecord::Base

  has_many :books, dependent: :destroy

  validates :name, :dob, :nationality, :biography, :image_url, presence: true
  validates :biography, length: { minimum: 15 }, unless: 'comment.blank?'

#  validates :name, :presence => true, allow_blank: false

end

