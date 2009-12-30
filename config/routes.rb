ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'posts', :action => 'index'
  map.resources :posts, :collection => { :feed => :get }, :member => { :comment => :post }, 
    :collection => { :upload_audio => :post }
  
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'
  map.login 'login', :controller => 'sessions', :action => 'new'
  map.register 'register/:token', :controller => 'users', :action => 'register'
  map.resources :sessions
  map.resources :users, :only => [:show, :edit, :update], :member => { :update_password => :put }
  map.edit_profile 'profile/edit', :controller => 'users', :action => 'edit'
  map.change_password 'profile/change_password', :controller => 'users', :action => 'change_password'

  map.tag 'tags/:name', :controller => 'tags', :action => 'show'

  map.namespace :admin do |admin|
    admin.root :controller => 'homepage', :action => 'index'
    admin.resources :audios, :only => [:index, :create, :destroy]
    admin.resources :invitations, :only => [:index, :new, :create, :destroy]
    admin.resources :pages, :except => [:show]
    admin.resources :menu_items, :collection => { :sort => :post }
  end

  map.page ':id', :controller => 'pages', :action => 'show'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
