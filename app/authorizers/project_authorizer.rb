class ProjectAuthorizer < ApplicationAuthorizer
  class << self
    def creatable_by? user
      user.has_role_admin?
    end
  end

  def updatable_by?(user, **opts)
    owner?(user, **opts) \
      || user.has_role_admin?
  end

  def deletable_by?(user, **opts)
    owner?(user, **opts) \
      || user.has_role_admin?
  end

  def permissionable_by?(user)
    owner?(user) \
      || user.has_role_admin?
  end

end
