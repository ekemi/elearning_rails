class Student < ApplicationRecord
    has_secure_password # allowed to use authentication
has_many :courses
has_many :reviews
has_many :reviewed_courses, through: :reviews, :sourse :course



end
