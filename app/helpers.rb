module Helpers

  def session_selection
    @session_user ||= Stats.get(session[:session_selection])
    Stats.all.to_json
  end

end
