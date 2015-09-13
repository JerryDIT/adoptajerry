class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can [:create, :update], Comment, user_id: user.id
    can :manage, GrapeSwaggerRails
  end
end
