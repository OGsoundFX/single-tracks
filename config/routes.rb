Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "tracks#index"
  get "zip", to: "tracks#zip"
  get "download", to: "tracks#download"
  get "download_multiple", to: "tracks#download_multiple"
  get "download_single", to: "tracks#download_single"
end
