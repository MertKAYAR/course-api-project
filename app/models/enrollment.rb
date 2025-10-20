class Enrollment < ApplicationRecord
  belongs_to :course
  belongs_to :student
  
  # Bire bir ilişki: Her kayıt için maksimum bir sertifika
  has_one :certificate, dependent: :destroy
  
  # Kayıt ve sertifika birleşik sorgulanabilir
  has_one :instructor, through: :course
end