class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    writer_or_admin?
  end

  def update?
    writer_or_admin?
  end

  private

  def writer_or_admin?
    user.writer? || user.admin?
  end
end
