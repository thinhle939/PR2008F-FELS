RailsAdmin.config do |config|

   config.authorize_with do
    redirect_to main_app.root_path unless current_user.admin == true
  end

  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  ### Popular gems integration


  # # == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  # == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end

  # config.model Category do
  #   edit do
  #     field :name do
  #       orderable true
  #     end
  #   end
  # end

  config.model Category do
    edit do
      field :name
      field :photo
    end
  end

  config.model WordAnswer do
    edit do
      field :content
      field :correct
    end
  end

  config.model Word do
    edit do
     include_fields :category, :content, :word_answers
       field :content, :ck_editor
    end
  end

end
