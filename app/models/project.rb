class Project < ApplicationRecord

  # role
  resourcify

  # auth
  include Authority::Abilities

  # association macros
  has_many :posts

  # validation macros
  validates :keyname, presence: true, length: {minimum: 5}, uniqueness: true
  validates :ptype, presence: true

  # audit
  audited

end
