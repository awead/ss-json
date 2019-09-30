# frozen_string_literal: true

Rails.application.routes.draw do
  resources :works do
    resources :versions, controller: :work_versions do # ,  shallow: true ???
      get 'file_list', to: 'file_lists#edit'
      put 'file_list', to: 'file_lists#update'
      patch 'file_list', to: 'file_lists#update'
    end
  end
end
