Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  constraints subdomain: 'api' do
    api_version(:module => "V1", :path => {:value => "v1"}) do
      resources :courses
    end
  end

  constraints subdomain: 'webhook' do
    api_version(:module => "V1", :path => {:value => "v1"}) do
      resources :webhooks
    end
  end
end
 