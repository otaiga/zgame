module ApplicationHelper

  def resource_name
    :user
  end

  def display_login
    if user_signed_in?
      link_to( "Log Out", destroy_user_session_path, :method => :delete) 
    else
      link_to( "Log In", new_session_path(resource_name)) 
    end
  end

end