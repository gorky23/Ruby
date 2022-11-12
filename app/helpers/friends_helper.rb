module FriendsHelper
  def dropdown_link_class(path)
    [ 'dropdown-item', ('active' if current_page?(path)) ]
  end
end
