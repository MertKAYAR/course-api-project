Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # Kurslar ve bu kursların kayıtları/sertifikaları için
      resources :courses, only: [:index, :show] do
        resources :enrollments, only: [:index, :show] # Kursa ait kayıtları listele
      end
    end
  end
end