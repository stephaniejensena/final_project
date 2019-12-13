Rails.application.routes.draw do

  #------------------------------


  match("/", { :controller => "user_sessions", :action => "new_session_form", :via => "get"})

  match("/profile", {:controller => "users", :action=> "view_default_profile", :via => "get"})
  match("/profile/:user_id", {:controller => "users", :action=> "view_profile", :via => "get"})

  # Routes for signing up
  match("/user_sign_up", { :controller => "users", :action => "new_registration_form", :via => "get"})

  # Routes for signing in
  match("/user_sign_in", { :controller => "user_sessions", :action => "new_session_form", :via => "get"})

  match("/user_verify_credentials", { :controller => "user_sessions", :action => "add_cookie", :via => "post"})

  # Route for signing out

  match("/user_sign_out", { :controller => "user_sessions", :action => "remove_cookies", :via => "get"})

  # Route for creating account into database

  match("/post_user", { :controller => "users", :action => "create", :via => "post" })

  # Route for editing account

  match("/edit_user", { :controller => "users", :action => "edit_registration_form_default", :via => "get"})

  match("/patch_user", { :controller => "users", :action => "update", :via => "post"})

  # Route for removing an account

  match("/cancel_user_account", { :controller => "users", :action => "destroy", :via => "get"})



  # Routes for the Outfit tag resource:

  # CREATE
  match("/insert_outfit_tag", { :controller => "outfit_tags", :action => "create", :via => "post"})
          
  # READ
  match("/outfit_tags", { :controller => "outfit_tags", :action => "index", :via => "get"})
  
  match("/outfit_tags/:id_from_path", { :controller => "outfit_tags", :action => "show", :via => "get"})
  
  # UPDATE
  
  match("/modify_outfit_tag/:id_from_path", { :controller => "outfit_tags", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_outfit_tag/:id_from_path", { :controller => "outfit_tags", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for the Outfit resource:

  # CREATE
  match("/insert_outfit", { :controller => "outfits", :action => "create", :via => "post"})
          
  # READ
  match("/outfits", { :controller => "outfits", :action => "index", :via => "get"})
  
  match("/outfits/:id_from_path", { :controller => "outfits", :action => "show", :via => "get"})
  
  # UPDATE
  
  match("/modify_outfit/:id_from_path", { :controller => "outfits", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_outfit/:id_from_path", { :controller => "outfits", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for the Friend resource:

  # CREATE
  match("/insert_friend", { :controller => "friends", :action => "create", :via => "post"})
  match("/friend_everyone", { :controller => "friends", :action => "friend_everyone", :via => "post"})

  # READ
  match("/friends", { :controller => "friends", :action => "index", :via => "get"})
  
  match("/friends/:id_from_path", { :controller => "friends", :action => "show", :via => "get"})
  
  # UPDATE
  
  match("/modify_friend/:id_from_path", { :controller => "friends", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_friend/:id_from_path", { :controller => "friends", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for the Comment resource:

  # CREATE
  match("/insert_comment", { :controller => "comments", :action => "create", :via => "post"})
          
  # READ
  match("/comments", { :controller => "comments", :action => "index", :via => "get"})
  
  match("/comments/:id_from_path", { :controller => "comments", :action => "show", :via => "get"})
  
  # UPDATE
  
  match("/modify_comment/:id_from_path", { :controller => "comments", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_comment/:id_from_path", { :controller => "comments", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for the Clothing tag resource:

  # CREATE
  match("/insert_clothing_tag", { :controller => "clothing_tags", :action => "create", :via => "post"})
          
  # READ
  match("/clothing_tags", { :controller => "clothing_tags", :action => "index", :via => "get"})
  
  match("/clothing_tags/:id_from_path", { :controller => "clothing_tags", :action => "show", :via => "get"})
  
  # UPDATE
  
  match("/modify_clothing_tag/:id_from_path", { :controller => "clothing_tags", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_clothing_tag/:id_from_path", { :controller => "clothing_tags", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for the Wear resource:

  # CREATE
  match("/insert_wear", { :controller => "wears", :action => "create", :via => "post"})
          
  # READ
  match("/wears", { :controller => "wears", :action => "index", :via => "get"})
  
  match("/wears/:id_from_path", { :controller => "wears", :action => "show", :via => "get"})
  
  # UPDATE
  
  match("/modify_wear/:id_from_path", { :controller => "wears", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_wear/:id_from_path", { :controller => "wears", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for the Outfit component resource:

  # CREATE
  match("/insert_outfit_component", { :controller => "outfit_components", :action => "create", :via => "post"})
          
  # READ
  match("/outfit_components", { :controller => "outfit_components", :action => "index", :via => "get"})
  
  match("/outfit_components/:id_from_path", { :controller => "outfit_components", :action => "show", :via => "get"})
  
  # UPDATE
  
  match("/modify_outfit_component/:id_from_path", { :controller => "outfit_components", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_outfit_component/:id_from_path", { :controller => "outfit_components", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for the Like resource:

  # CREATE
  match("/insert_like", { :controller => "likes", :action => "create", :via => "post"})
          
  # READ
  match("/likes", { :controller => "likes", :action => "index", :via => "get"})
  
  match("/likes/:id_from_path", { :controller => "likes", :action => "show", :via => "get"})
  
  # UPDATE
  
  match("/modify_like/:id_from_path", { :controller => "likes", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_like/:id_from_path", { :controller => "likes", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for the Post resource:

  # CREATE
  match("/insert_post", { :controller => "posts", :action => "create", :via => "post"})
          
  # READ
  match("/posts", { :controller => "posts", :action => "index", :via => "get"})
  
  match("/posts/:id_from_path", { :controller => "posts", :action => "show", :via => "get"})
  
  # UPDATE
  
  match("/modify_post/:id_from_path", { :controller => "posts", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_post/:id_from_path", { :controller => "posts", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for the Image resource:

  # CREATE
  match("/insert_image", { :controller => "images", :action => "create", :via => "post"})
          
  # READ
  match("/images", { :controller => "images", :action => "index", :via => "get"})
  
  match("/images/:id_from_path", { :controller => "images", :action => "show", :via => "get"})
  
  # UPDATE
  
  match("/modify_image/:id_from_path", { :controller => "images", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_image/:id_from_path", { :controller => "images", :action => "destroy", :via => "get"})



  #------------------------------

  # Routes for the Clothing item resource:

  # CREATE
  match("/insert_clothing_item", { :controller => "clothing_items", :action => "create_form", :via => "get"})
  match("/insert_clothing_item", { :controller => "clothing_items", :action => "create", :via => "post"})

  match("/generate_wardrobe", { :controller => "clothing_items", :action => "generate_wardrobe", :via => "post"})
          
  # READ
  match("/closet", { :controller => "clothing_items", :action => "index_default", :via => "get"})
  match("/closet/:owner_id", { :controller => "clothing_items", :action => "index", :via => "get"})
  
  match("/clothing_item/:id_from_path", { :controller => "clothing_items", :action => "show", :via => "get"})
  
  # UPDATE
  match("/modify_clothing_item/:id_from_path", {:controller => "clothing_items", :action => "edit", :via => "get"})
  match("/modify_clothing_item/:id_from_path", { :controller => "clothing_items", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_clothing_item/:id_from_path", { :controller => "clothing_items", :action => "destroy", :via => "get"})

  #------------------------------

  # ======= Add Your Routes Above These =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
