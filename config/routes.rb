# frozen_string_literal: true

Rails.application.routes.draw do
  root "audios#index"

  post "/audios/upload", to: "audios#upload"
end
