Rails.application.routes.draw do
  root to: "pages#home"

  get "link-projet", to: "pages#link_projet", as: "link_projet"

  post "contact", to: "pages#contact"
end
