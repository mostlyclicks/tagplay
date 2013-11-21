Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :projects do
    resources :projects, :path => '', :only => [:index, :show]
    get 'tags/:tag', to: 'projects#index', as: :tag
  end

  # Admin routes
  namespace :projects, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :projects, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
