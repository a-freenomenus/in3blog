ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'posts', :action => 'index'
  map.resources :posts, :only => [:index, :show]

  map.namespace :admin do |admin|
    admin.root :controller => 'posts', :action => 'index'
    admin.resources :posts, :except => [:show]
    admin.resources :audios, :only => [:index, :create, :destroy]
  end

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
