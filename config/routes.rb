# frozen_string_literal: true

Rails.application.routes.draw do
  resources :welcomes

  api_version(module: 'V1', path: { value: 'api/v1' }) do
    resources :courses
  end

  api_version(module: 'V1', path: { value: 'webhook/v1' }) do
    resources :webhooks
  end
end
