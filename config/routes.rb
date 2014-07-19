Rails.application.routes.draw do
  get 'id_informations/show'
  get 'id_informations/edit'
  patch 'id_informations/update'

  resources :basic_informations
  resources :list_informations do
    resources :list_items
  end
  resources :lists, only: [:update]
  resources :time_range_informations
  resources :time_range_list_informations do
    resources :list_items
  end
end
