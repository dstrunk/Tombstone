RailsAdmin.config do |config|
  config.authorize_with do
    if signed_in?
      unless current_user.admin?
        redirect_to(
          main_app.root_path,
          alert: "You are not permitted to view this page"
        )
      end
    else
      redirect_to(
        main_app.sign_in_path,
        alert: "You must sign in to view this page"
      )
    end
  end

  config.current_user_method { current_user }

  # config.excluded_models = ["JobNumber", "Status"]
end


