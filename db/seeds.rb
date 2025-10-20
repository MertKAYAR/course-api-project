# db/seeds.rb

# Temizlik
Certificate.destroy_all
Enrollment.destroy_all
Course.destroy_all
Instructor.destroy_all
Student.destroy_all

puts "Veri tabanı temizlendi."

# 1. Eğitmenler
inst_ali = Instructor.create!(name: "Ali Güneş", bio: "Full Stack Uzmanı")
inst_deniz = Instructor.create!(name: "Deniz Yılmaz", bio: "Veri Bilimci")

# 2. Öğrenciler
stud_ayse = Student.create!(name: "Ayşe Tekin", email: "ayse@mail.com")
stud_berat = Student.create!(name: "Berat Kaya", email: "berat@mail.com")

# 3. Kurslar
course1 = inst_ali.courses.create!(title: "Ruby on Rails API Geliştirme", duration_hours: 40, difficulty: "Orta")
course2 = inst_deniz.courses.create!(title: "Python ile Veri Analizi", duration_hours: 30, difficulty: "Kolay")

# 4. Kayıtlar (Enrollments)
# Ayşe, Rails kursuna kaydoldu ve tamamladı
enroll1 = course1.enrollments.create!(student: stud_ayse, date_enrolled: Date.today.ago(2.months), completion_status: true)
# Berat, Python kursuna kaydoldu ama henüz tamamlamadı
enroll2 = course2.enrollments.create!(student: stud_berat, date_enrolled: Date.today.ago(1.month), completion_status: false)

# 5. Sertifika (Bire Bir İlişki)
# Ayşe'nin tamamladığı kayıt için sertifika oluştur
enroll1.create_certificate!(issue_date: Date.today.ago(1.day), unique_code: "CERT-RAILS-001")

puts "Test verileri başarıyla oluşturuldu."