MawidaQA::Application.routes.draw do
  constraints(AdminSubdomain) do
    match '/launchpad' => 'launchpad#index', as: 'launchpad', via: :get

    resources :organizations do
      resources :users
    end

    resources :tags, only: [ :index ] do
      resources :documents, only: [ :index ]
    end
  
    resources :documents do
      member do
        put :revise
        put :reject
        put :approve
        get :create_revision
      end
    end

    devise_for :users
  
    resources :users do
      member do
        get :edit_profile
        put :update_profile
      end
    end
  
    match 'private/:path', to: 'files#download', constraints: { path: /.+/ }
  
    root to: 'documents#index'
  end

  constraints(OrganizationSubdomain) do
    match '/launchpad' => 'launchpad#index', as: 'launchpad', via: :get

    resources :organizations do
      resources :users
    end

    resources :tags, only: [ :index ] do
      resources :documents, only: [ :index ]
    end
  
    resources :documents do
      member do
        put :revise
        put :reject
        put :approve
        get :create_revision
      end
    end

    devise_for :users
  
    resources :users do
      member do
        get :edit_profile
        put :update_profile
      end
    end
  
    match 'private/:path', to: 'files#download', constraints: { path: /.+/ }
  
    root to: 'documents#index'
  end

  get 'errors/error_404'

  match '*not_found', to: 'errors#error_404'
end
