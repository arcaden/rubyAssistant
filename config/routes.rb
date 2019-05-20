Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
    api_version(:module => "V1", :path => {:value => "api/v1"}) do
      resources :courses
    end

    api_version(:module => "V1", :path => {:value => "webhook/v1"}) do
      resources :webhooks
    end
end
 