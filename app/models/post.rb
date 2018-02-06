class Post < ApplicationRecord

  # role
  resourcify

  # auth
  include Authority::Abilities

  # association macros
  belongs_to :project

  # validation macros
  validates :keyname, presence: true, length: {minimum: 5}, uniqueness: true

  # audit
  audited
  has_associated_audits

end
