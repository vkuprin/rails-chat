# frozen_string_literal: true

Authentication::Engine.routes.draw do
  scope module: "api", path: "api" do
    devise_for :users, class_name: "Authentication::User", defaults: {format: :json},
                       controllers: {
                         sessions:      "authentication/sessions",
                         registrations: "authentication/registrations"
                       }
  end
end
