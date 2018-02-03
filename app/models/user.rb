class User < ApplicationRecord

  # devise
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

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

  def self.at_who dnum = nil

    all.order("username = '#{dnum}' DESC").each_with_object([]) do |item, ary|
      next if item.username.nil?
      text = "#{item.username} / #{item.name} / #{item.email}"
      val = "#{item.username}"

      ary << [text, val]
    end
  end

end
