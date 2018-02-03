class Project < ApplicationRecord

  # role
  resourcify

  # auth
  include Authority::Abilities

end
