ActionController::Routing::Routes.draw do |map|
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'
  map.login 'login', :controller => 'sessions', :action => 'new'
  map.resources :sessions

  map.root :controller => 'posts', :action => 'index'
  map.resources :posts, :collection => { :feed => :get }
  map.resources :users, :only => [:show, :edit, :update]
  map.tag 'tags/:name', :controller => 'tags', :action => 'show'

  map.namespace :admin do |admin|
    admin.root :controller => 'posts', :action => 'index'
    admin.resources :posts, :except => [:show]
    admin.resources :audios, :only => [:index, :create, :destroy]
  end

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
