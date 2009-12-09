ActionController::Routing::Routes.draw do |map|
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'
  map.login 'login', :controller => 'sessions', :action => 'new'
  map.register 'register/:token', :controller => 'users', :action => 'register'
  map.resources :sessions

  map.root :controller => 'posts', :action => 'index'
  map.resources :posts, :collection => { :feed => :get }
  map.resources :users, :only => [:show, :edit, :update]
  map.tag 'tags/:name', :controller => 'tags', :action => 'show'

  map.namespace :admin do |admin|
    admin.resources :audios, :only => [:index, :create, :destroy]
    admin.resources :invitations, :only => [:index, :new, :create, :destroy]
  end

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
