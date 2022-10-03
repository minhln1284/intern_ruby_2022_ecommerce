# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize user
    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
    alias_action :index, :show, to: :read
    # alias_action :new, to: :create
    alias_action :edit, :show, to: :update

    return unless user.present?

    case user.role
    when "user"
      can :read, Product
      can :manage, Order, user_id: user.id
    when "admin"
      can :manage, :all
    when "manager"
      can :manage, Order
      can %i(update read), Product
      can %i(update read), Category
      cannot :destroy, Category
    end
  end
end
