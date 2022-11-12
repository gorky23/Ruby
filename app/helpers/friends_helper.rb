module FriendsHelper
  def friends()
    return "APLIKACJA FRIENDS"
  end
  def nav_link_class(path)
    [ 'nav-link', ('active' if current_page?(path)) ]
  end
  def dropdown_link_class(path)
    [ 'dropdown-item', ('active' if current_page?(path)) ]
  end
end
