GoalSetter::Application.routes.draw do

  resources :users, :only => [:new, :create, :show] do
    resource :user_comments, :only => [:create]
    resources :goals, :only => [:new, :create]
  end

  resources :goals, :except => [:new, :create] do
      put 'mark_as_complete'
      resources :goal_comments, :only => [:create]
    end

  resource :session, :only => [:new, :create, :destroy]
end
