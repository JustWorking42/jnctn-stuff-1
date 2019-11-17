Rails.application.routes.draw do
  mount Api::Base, at: "/"
  mount GrapeSwaggerRails::Engine, at: "/docs"
end
