class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :edit, :update, :destroy, :to => :modify

    if user.admin?
      can :manage, :all
    else
      can :modify, Post do |post|
        post && post.user == user
      end
      can :create, Post
    end
  end
end
