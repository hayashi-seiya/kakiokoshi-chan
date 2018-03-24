# frozen_string_literal: true

Rails.application.routes.draw do
  root "files#index"

  post "/files/upload", to: "files#upload"
end
