class User < ApplicationRecord

  # devise
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # rolify
  rolify

  ## role - guest / owner / admin
  DEFAULT_ROLE = :guest
  after_create :set_default_role

  def set_default_role
    add_role(DEFAULT_ROLE) if roles.blank?
  end

  def has_role_admin?
    has_role?(:admin)
  end

  def has_role_project_owner?(project)
    has_role?(:owner, project)
  end

end
