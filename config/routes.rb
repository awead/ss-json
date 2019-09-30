# frozen_string_literal: true

Rails.application.routes.draw do
  resources :works do
    resources :versions, controller: :work_versions # ,  shallow: true ???
  end
end
