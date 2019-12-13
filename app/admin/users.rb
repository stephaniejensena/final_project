ActiveAdmin.register User do
  permit_params :email, :password_digest, :username, :first_name, :last_name, :height, :weight, :pant_size, :shirt_size, :dress_size, :shoe_size, :pant_size_units, :shirt_size_units, :dress_size_units, :shoe_size_units, :profile_picture, :bio


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
