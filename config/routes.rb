# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: 'omniauth_callbacks'
  }

  devise_scope :user do
    get 'sign_in', :to => 'users/sessions#new', :as => :new_user_session
  end

  mount Shrine.upload_endpoint(:cache) => '/upload'
  resources :works do
    resources :versions, controller: :work_versions do # ,  shallow: true ???
      get 'file_list', to: 'file_lists#edit'
      put 'file_list', to: 'file_lists#update'
      patch 'file_list', to: 'file_lists#update'
      resources :files, controller: :file_version_memberships
    end
  end
end
