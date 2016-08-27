class Lesson < ApplicationRecord
has_many :assignments
belongs_to :user
validates_presence_of :lesson_date
end
