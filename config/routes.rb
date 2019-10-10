# frozen_string_literal: true

Rails.application.routes.draw do
  mount Shrine.upload_endpoint(:cache) => '/upload'
  resources :works do
    resources :versions, controller: :work_versions do # ,  shallow: true ???
      get 'file_list', to: 'file_lists#edit'
      put 'file_list', to: 'file_lists#update'
      patch 'file_list', to: 'file_lists#update'
      get 'publish', to: 'work_versions#publish'
      resources :files, controller: :file_version_memberships
    end
  end
  root 'works#index'
end
