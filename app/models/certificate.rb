class Certificate < ApplicationRecord
  # Bire bir ilişki: Sertifika bir kayıt işlemine aittir
  belongs_to :enrollment
end