%w(admin editor).each do |uname|
  unless User.find_by_username(uname)
    u = User.new(:username => uname, :email => "#{uname}@domain.com",
             :password => uname, :password_confirmation => uname) 
    u.role = uname
    u.save
  end
end

unless Page.find_by_permalink('about')
  Page.create(:permalink => 'about', :body => 'About this blog')
end
