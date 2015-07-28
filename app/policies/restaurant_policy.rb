class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end


  def index?
    user.admin == true
  end

  def create?
    user.admin == true
  end

  def update?
    record.user == user || user.admin == true
  end

  def destroy?
    record.user == user || user.admin == true
  end

end
