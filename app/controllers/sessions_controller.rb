class SessionsController < Devise::SessionsController
  def new

    self.resource = resource_class.new(sign_in_params)
    store_location_for(resource, params[:redirect_to])
    super
  end

  def create
    super
  end

  def edit
  end

  def destroy
    super
    flash.delete(:notice)
  end

  # after login
  # https://github.com/plataformatec/devise/blob/master/app/controllers/devise/sessions_controller.rb#L20
  def after_sign_in_path_for user

    user = User.find(user.id)
    pp user

    session[:user_id]           = user.id
    session[:cn]                = user.username
    session[:display_name]      = ''
    session[:name]              = ''
    session[:departmentNumber]  = ''

    # for block hijacking
    cookies.signed[:secure_user_id] = {secure: true, value: "secure#{request.remote_ip}#{user.id}", :httponly => true}

    # https://github.com/plataformatec/devise/wiki/How-To:-Redirect-to-a-specific-page-on-successful-sign-in
    # MONI-117
    flash[:success] = flash[:notice]
    # request.env['omniauth.origin'] || stored_location_for(user) || posts_path
    request.env['omniauth.origin'] || root_path
  end

  # from devise
  # after logout
  # https://github.com/plataformatec/devise/blob/master/app/controllers/devise/sessions_controller.rb#L68
  def after_sign_out_path_for user
    reset_session

    # for hijacking
    # cookies.delete :secure_user_id

    new_user_session_path
    # root_path
  end

end
