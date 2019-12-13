class FriendsController < ApplicationController
  def index
    @friends = Friend.where(:friender_id => @current_user[:id]).or(Friend.where(:friendee_id => @current_user[:id])).order({ :created_at => :desc })

    render({ :template => "friends/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @friend = Friend.where({:id => the_id }).at(0)

    render({ :template => "friends/show.html.erb" })
  end


  def friend_everyone
    User.all.each do |friendee|
      new_friend = Friend.new
      new_friend.friender_id = @current_user[:id]
      new_friend.friendee_id = friendee[:id]
      new_friend.accepted = true
      new_friend.save
    end
    redirect_to("/friends")
  end

  def create
    @friend = Friend.new
    @friend.friender_id = @current_user[:id]
    @friend.friendee_id = User.where({:username =>params.fetch("friendee_id_from_query")})[0][:id]
    @friend.accepted = true

    if @friend.valid?
      @friend.save
      redirect_to("/friends", { :notice => "Friend created successfully." })
    else
      redirect_to("/friends", { :notice => "Friend failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @friend = Friend.where({ :id => the_id }).at(0)

    @friend.friender_id = params.fetch("friender_id_from_query")
    @friend.friendee_id = params.fetch("friendee_id_from_query")
    @friend.accepted = params.fetch("accepted_from_query", false)

    if @friend.valid?
      @friend.save
      redirect_to("/friends/#{@friend.id}", { :notice => "Friend updated successfully."} )
    else
      redirect_to("/friends/#{@friend.id}", { :alert => "Friend failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @friend = Friend.where({ :id => the_id }).at(0)

    @friend.destroy

    redirect_to("/friends", { :notice => "Friend deleted successfully."} )
  end
end
