class PostAuthorizer < ApplicationAuthorizer
  class << self
    def creatable_by? user, project
      user.has_role_project_owner?(project) \
        || user.has_role_admin?
    end
  end

  def updatable_by?(user, project)
    owner?(user) \
      || user.has_role_project_owner?(project) \
      || user.has_role_admin?
  end

  def deletable_by?(user, project)
    owner?(user) \
      || user.has_role_admin?
  end
end