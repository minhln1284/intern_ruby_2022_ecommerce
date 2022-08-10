Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    get "/detail", to: "static_pages#detail"
    get "/mens", to: "static_pages#mens"
    get "/womens", to: "static_pages#womens"
    resources :user

    namespace :admin do
      resources :static_pages
      resources :categories
      root "static_pages#index"
    end
  end
end
