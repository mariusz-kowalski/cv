Rails.application.routes.draw do
  get 'id_informations/show'
  get 'id_informations/edit'
  patch 'id_informations/update'

  resources :basic_informations
end
