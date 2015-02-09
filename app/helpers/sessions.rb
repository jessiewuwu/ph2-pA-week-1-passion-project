helpers do

  def current_user
    if session[:id]
      @current_user ||= Volunteer.find(session[:id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def current_admin
    if session[:admin_id]
      @current_admin ||= Admin.find(session[:admin_id])
    end
  end

  def admin_logged_in?
    !current_admin.nil? #this is referring to the method, not the instance variable
  end

end


