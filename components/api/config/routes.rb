# frozen_string_literal: true

Api::Engine.routes.draw do
  scope "api/chat" do
    resources :group_messages
    resources :groups
  end
end
