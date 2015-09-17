class Ability
  include CanCan::Ability

  def initialize(maker)
    maker ||= Maker.new # guest user (not logged in)

    if maker.has_role?(:admin)
      can :manage, :all
      can :access, :rails_admin   # grant access to rails_admin
      can :dashboard              # grant access to the dashboard
    else
      can :read, Jerry
      can :read, Page
      can :read, Comment
      can [:create, :update], Comment, user_id: maker.id
    end
  end
end
