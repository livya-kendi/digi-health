Rails.application.routes.draw do
  resources :records
  resources :appointments
  resources :patients
  resources :doctors
end
