helpers do

  def current_user
    if session[:volunteer_id]
      @current_user ||= Volunteer.find(session[:volunteer_id])
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


