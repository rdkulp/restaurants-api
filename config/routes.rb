
Rails.application.routes.draw do
  use_doorkeeper do
    skip_controllers :applicaitons, :authorized_applications
  end
  scope module: :api, defaults: { format: :json }, path: 'api' do
    scope module: :v1 do
      devise_for :users, controllers: {
           registrations: 'api/v1/users/registrations',
       }, skip: [:sessions, :password]
    end
  end

  authenticated :user do
    resources :restaurants
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
