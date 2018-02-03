class User < ApplicationRecord

  # devise
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # rolify
  rolify

  # Authority
  include Authority::UserAbilities


  ## role - guest / owner / admin
  DEFAULT_ROLE = :guest
  after_create :set_default_role
  attr_accessor :auth_attr

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
