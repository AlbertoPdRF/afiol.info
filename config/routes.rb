Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    root to: 'pages#homepage'

    get '/about' => 'pages#about'
    get '/research' => 'pages#research'
    get '/speedcubing' => 'pages#speedcubing'

    get '/contact' => 'messages#new'
    post '/contact' => 'messages#create', as: 'create_message'
  end
end
