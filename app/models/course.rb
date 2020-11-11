class Course < ApplicationRecord
  belongs_to :student
  has_many :reviews
  has_many :students, through: :reviews

validates :topic , :location , :roomNumber,:profesorName, :starDate , 
:endDate, :beginningTime, :endingTime, :requirements, presence: true
scope :beta,->{order('LOWER(topic)')} #Lower to make it case insensitive

def self.search (topic_name)
    Course.where("topic LIKE ?", "%#{topic_name}%").beta
end
end
