class User < ActiveRecord::Base
<<<<<<< HEAD
  validates :name, presence: true, uniqueness: true
=======
	validates :name, presence: true, uniqueness: true
>>>>>>> 8d3127353a32a2e795c348863962c4265cfa31b3
  has_secure_password
end
