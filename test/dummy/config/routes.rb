Rails.application.routes.draw do

  mount Payment::Engine => "/payment"
end
