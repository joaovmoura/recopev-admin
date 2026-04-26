RailsAdmin.config do |config|
  config.asset_source = :sprockets

  config.authenticate_with do
    authenticate_or_request_with_http_basic('Recopev Admin') do |username, password|
      username == ENV['ADMIN_USERNAME'] && password == ENV['ADMIN_PASSWORD']
    end
  end

  config.current_user_method { nil }

  config.included_models = ['User']

  config.model 'User' do
    list do
      field :id
      field :email
      field :created_at
    end
    edit do
      field :email
      field :password, :password do
        help 'Mínimo 6 caracteres. Deixe em branco para manter a senha atual.'
      end
      field :password_confirmation, :password do
        help 'Repita a senha acima.'
      end
    end
  end

  config.actions do
    dashboard
    index
    new
    show
    edit
    delete
  end
end
