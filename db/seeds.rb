User.create(:username => 'editor', :email => 'editor@domain.com',
           :password => 'editor', :password_confirmation => 'editor') unless User.find_by_username('editor')

unless User.find_by_username('administrator')
  user = User.create(:username => 'administrator', :email => 'administrator@domain.com',
             :password => 'administrator', :password_confirmation => 'administrator')
  user.admin = true
  user.save
end

unless Page.find_by_permalink('about')
  Page.create(:permalink => 'about', :body => 'About this blog')
end
