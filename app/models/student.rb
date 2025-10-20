class Student < ApplicationRecord
    has_many :enrollments, dependent: :destroy
    # Kayıt olduğu kurslara erişim (N:M ilişki)
    has_many :courses, through: :enrollments
  end