Rails.application.routes.draw do
    devise_for :users
    root 'application/home#index'
    namespace :admin do
        resources :home
        resources :stored_images
        resources :email_templates do
            collection do
                get 'default_email_template_source'
            end
        end
        resources :users do
            member do
                get 'edit_password'
                patch 'update_password'
            end
        end
    end
end
