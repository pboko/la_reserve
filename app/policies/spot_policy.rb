class SpotPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    true
  end

  def create?
    user.admin == true
  end

  def update?
    true
  end

  def destroy?
    record.user == user || user.admin == true
  end

end
