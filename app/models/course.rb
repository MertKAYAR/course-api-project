class Course < ApplicationRecord
  belongs_to :instructor
  has_many :enrollments, dependent: :destroy
  # Öğrenci listesine erişim (N:M ilişki)
  has_many :students, through: :enrollments
end