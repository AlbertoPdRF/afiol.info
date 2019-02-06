Rails.application.routes.draw do
  root_path = 'pages#homepage'

  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    get '/about' => 'pages#about'
    get '/research' => 'pages#research'
    get '/speedcubing' => 'pages#speedcubing'
    get '/contact' => 'pages#contact'
  end

  root to: root_path
  get '/:locale', to: root_path
end
