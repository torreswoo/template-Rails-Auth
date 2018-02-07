module ProjectsHelper


  def user_permission_role user

    role = nil
    role = user.has_role_project_owner?(@project) ? 'Owner' : role
    role = user.has_role_admin? ? 'Admin' : role

    icon = case role
             when 'Admin' then 'fa-users'
             when 'Owner' then 'fa-user-circle'
             else ''
           end

    return role, icon
  end


end
