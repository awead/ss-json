# frozen_string_literal: true

Rails.application.routes.draw do
  resources :works do
    resources :work_versions, as: :versions, path: :versions
  end
end
