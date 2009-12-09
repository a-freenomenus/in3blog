User.create(:username => 'editor', :email => 'editor@domain.com',
           :password => 'editor', :password_confirmation => 'editor')
user = User.create(:username => 'administrator', :email => 'administrator@domain.com',
           :password => 'administrator', :password_confirmation => 'administrator')
user.admin = true
user.save
