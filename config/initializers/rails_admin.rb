RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :maker
  end
  config.current_user_method(&:current_maker)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == PaperTrail ==
  config.audit_with :paper_trail, 'Maker', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

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

    ## With an audit adapter, you can add:
    history_index
    history_show
  end

  config.model Page do

    edit do
      field :name
      field :content, :ck_editor
      field :step do
        help "ex: type 1 for 'Define & Plan', 4b for 'Make', 0 for 'Document'.
          Let it empty if the page is not associated to the diagram of the page 'Build your Jerry'"
      end
      include_all_fields
    end

  end
end
