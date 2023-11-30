class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # гость

    if user.has_role? :landlord
      can :manage, Apartment
    elsif user.has_role? :tenant
      can :read, Apartment
    end
  end
end