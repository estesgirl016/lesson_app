class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :lessons

  # # Returns all students under this teacher
  # has_many :students, :class_name => 'User', :foreign_key => :teacher_id

  # # Returns this student's teacher
  # belongs_to :teacher, :class_name => 'User'

  # If user has no teacher, she's a teacher
  def teacher?
    teacher_id.nil?
  end

  # If user has a teacher, she's a student
  def student?
    !teacher?
  end
end
