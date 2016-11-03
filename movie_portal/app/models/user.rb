class User < ActiveRecord::Base

	has_one :roles
	has_many :movies, through: :roles


	validates :name,on: :create, presence: true
	validates :age,on: :create, presence: true
	validates :role, on: :create, presence: true
	validates :gender, on: :create, presence: true



end
