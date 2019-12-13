class UsersController < ApplicationController
  skip_before_action(:force_user_sign_in, { :only => [:new_registration_form, :create] })
  
  def new_registration_form
    render({ :template => "user_sessions/sign_up.html.erb" })
  end

  def view_default_profile
    @user = @current_user
    render({:template => "users/profile.html.erb"})
  end

  def view_profile
    @user = User.where({:id => params.fetch("user_id")})[0]
    render({:template => "users/profile.html.erb"})
  end

  def create
    @user = User.new
    @user.email = params.fetch("email_from_query")
    @user.password = params.fetch("password_from_query")
    @user.password_confirmation = params.fetch("password_confirmation_from_query")
    @user.username = params.fetch("username_from_query")
    @user.first_name = params.fetch("first_name_from_query")
    @user.last_name = params.fetch("last_name_from_query")
    @user.bio = params.fetch("bio_from_query")

    @user.save
    image_url = params.fetch("profile_picture_from_query")
    new_default_image = Image.new
    new_default_image.owner_id = @user[:id]
    new_default_image.image = image_url
    new_default_image.save

    @user.profile_picture_id = new_default_image[:id]

    save_status = @user.save

    if save_status == true
      session.store(:user_id,  @user.id)
   
      redirect_to("/profile", { :notice => "User account created successfully."})
    else
      redirect_to("/user_sign_up", { :alert => "User account failed to create successfully."})
    end
  end
    

  def edit_registration_form_default
    render({ :template => "users/edit_profile.html.erb" })
  end

  def update
    @user = @current_user
    @user.email = params.fetch("email_from_query")
    @user.password = params.fetch("password_from_query")
    @user.password_confirmation = params.fetch("password_confirmation_from_query")
    @user.username = params.fetch("username_from_query")
    @user.first_name = params.fetch("first_name_from_query")
    @user.last_name = params.fetch("last_name_from_query")
    @user.height = params.fetch("height_from_query")
    @user.pant_size = params.fetch("pant_size_from_query")
    @user.shirt_size = params.fetch("shirt_size_from_query")
    @user.dress_size = params.fetch("dress_size_from_query")
    @user.shoe_size = params.fetch("shoe_size_from_query")
    @user.pant_size_units = params.fetch("pant_size_units_from_query")
    @user.shirt_size_units = params.fetch("shirt_size_units_from_query")
    @user.dress_size_units = params.fetch("dress_size_units_from_query")
    @user.shoe_size_units = params.fetch("shoe_size_units_from_query")
    #@user.profile_picture = params.fetch("profile_picture_from_query")
    @user.bio = params.fetch("bio_from_query")
    @user.height_units = params.fetch("height_units_from_query")
    @user.birthdate = params.fetch("birthdate_from_query")

    image_url = params.fetch("profile_picture_url_from_query")
    new_default_image = Image.new
    new_default_image.owner_id = @user[:id]
    new_default_image.image = image_url
    new_default_image.save

    @user.profile_picture_id = new_default_image[:id]
    
    if @user.valid?
      @user.save

      redirect_to("/profile", { :notice => "User account updated successfully."})
    else
      render({ :template => "users/edit_profile_with_errors.html.erb" })
    end
  end

  def destroy
    @current_user.destroy
    reset_session
    
    redirect_to("/", { :notice => "User account cancelled" })
  end
  
end
