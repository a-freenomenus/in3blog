class Admin::AdminController < ApplicationController
  layout 'admin'
  
  before_filter :check_rights

  private

  def check_rights
    unauthorized! if cannot? :manage, :all
  end
end
