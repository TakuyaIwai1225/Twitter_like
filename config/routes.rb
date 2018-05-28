Rails.application.routes.draw do
  get 'staticpages/heme'

  get 'staticpages/help'

 root 'application#hello'
end
