class Movie < ActiveRecord::Base

	has_many :roles
	has_many :users, through: :roles

	validates :title,on: :create, presence: true, uniqueness: true, length: {minimum: 2}
	validates :year,on: :create, presence: true
	validates :rating,on: :create,presence: true,
	 numericality: {greater_than: 0.0, less_than_or_equal_to: 10.0}
	validates :language, on: :create, presence: true
	validates :actors, on: :create, presence: true
	validates :director, on: :create, presence: true
	validates :producer,on: :create, presence: true 
end
