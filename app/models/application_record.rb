class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # use resourcify (roles)
  def owner
    User.with_role(:owner, self).map {|e|
      "#{e.username} / #{e.email}"
    }
  end

end
