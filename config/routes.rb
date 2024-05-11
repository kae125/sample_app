Rails.application.routes.draw do
  get 'lists/new'
  
  get 'top' => 'home#top'
  post 'lists' => 'lists#create'
  get 'lists' => 'lists#index'
  
  # .../lists/1 や .../lists/3に該当する
  get 'lists/:id' => 'lists#show', as: 'list'
  
end
