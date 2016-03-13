module ApplicationHelper
  def alert_key(flash_key)
    return 'success' if flash_key == :notice
    return 'danger' if flash_key == :alert
  end
end
