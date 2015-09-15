class Ability
  include CanCan::Ability

  def initialize(maker)
    maker ||= Maker.new # guest user (not logged in)

    can :read, Comment
    can [:create, :update], Comment, user_id: maker.id
    can :read, Jerry
    can :manage, GrapeSwaggerRails
  end
end
