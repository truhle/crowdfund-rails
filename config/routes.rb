Rails.application.routes.draw do

  root "projects#index"
  # get "/projects" => "projects#index"
  # get "/projects/new" => "projects#new"
  # get "/projects/:id" => "projects#show", as: "project"
  # get "/projects/:id/edit" => "projects#edit", as: "edit_project"
  # patch "/projects/:id" => "projects#update"

  resources :projects do
    resources :pledges
  end

end
