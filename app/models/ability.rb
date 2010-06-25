class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :edit, :update, :destroy, :to => :modify

    if user.admin?
      can :manage, :all
    elsif user.editor?
      can :modify, Post do |post|
        post && post.user == user
      end
      can :create, Post
      can :modify, Comment do |comment|
        comment.post.user == user
      end
    end
  end
end

