Rails.application.routes.draw do
  mount Api::Engine => '/'
  mount Authentication::Engine => '/'
  mount Chat::Engine => '/'
end
