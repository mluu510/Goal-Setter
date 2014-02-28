GoalSetter::Application.routes.draw do

  resources :users, :only => [:new, :create, :show] do
    resources :goals, :only => [:new, :create]
  end

  resources :goals, :except => [:new, :create] do
      put 'mark_as_complete'
    end

  resource :session, :only => [:new, :create, :destroy]
end
