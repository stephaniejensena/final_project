Rails.application.routes.draw do



  # Routes for the Clothing item resource:

  # CREATE
  match("/insert_clothing_item", { :controller => "clothing_items", :action => "create", :via => "post"})
          
  # READ
  match("/clothing_items", { :controller => "clothing_items", :action => "index", :via => "get"})
  
  match("/clothing_items/:id_from_path", { :controller => "clothing_items", :action => "show", :via => "get"})
  
  # UPDATE
  
  match("/modify_clothing_item/:id_from_path", { :controller => "clothing_items", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_clothing_item/:id_from_path", { :controller => "clothing_items", :action => "destroy", :via => "get"})

  #------------------------------

  # ======= Add Your Routes Above These =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
