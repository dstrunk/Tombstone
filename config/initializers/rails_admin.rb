require Rails.root.join('lib/rails_admin_accept_review')
require Rails.root.join('lib/rails_admin_reject_review')
require Rails.root.join('lib/rails_admin_archive_review')
require Rails.root.join('lib/rails_admin_release_live')

RailsAdmin.config do |config|
  config.authorize_with do
    unless current_user
      session[:return_to] = request.url
      redirect_to "/sign_in", alert: "You must log in or sign up befor accessing this page."
    end
  end

  config.authorize_with do
    redirect_to "/", alert: "You are not authorized to access that page" unless current_user.admin?
  end

  config.current_user_method { current_user }

  config.main_app_name = ['Tombstone', 'Admin']

  config.yell_for_non_accessible_fields = false

  config.actions do
    # root actions
    dashboard  # mandatory
    
    # collection actions
    index      # mandatory
    new
    export

    # member actions
    show
    edit
    accept_review
    reject_review
    archive_review
    release_live
  end

  config.excluded_models = ["AuraTransition"]

  config.model Aura do
    list do
      field :name
      field :description
      field :job_number
      field :customer
      field :user
      field :start_date
      field :end_date
      field :ongoing
      scopes [:all, :unstarted, :rejected, :accepted, :live, :archived]
    end

    edit do
      field :job_number, :belongs_to_association
      field :customer, :belongs_to_association
      field :user, :belongs_to_association
      field :description
      field :name
      field :start_date
      field :end_date
      field :ongoing
    end
  end

  config.model JobNumber do
    edit do
      field :number do
        label "Job number"
      end
    end
  end

  config.model User do
    list do
      field :email
      field :admin
      field :created_at
      field :updated_at
      field :auras, :has_many_association
    end

    edit do
      field :admin
      field :email
      field :password
    end

    exclude_fields :id, :confirmation_token
  end
end


