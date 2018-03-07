Rails.application.routes.draw do
    devise_for :users
    root 'application/home#index'
    namespace :admin do
        resources :home
        resources :users
        resources :stored_images
        resources :email_templates do
            collection do
                get 'default_email_template_source'
            end
        end
    end
end
