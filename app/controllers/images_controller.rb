class ImagesController < ApplicationController
  def index
    @images = Image.all.order({ :created_at => :desc })

    render({ :template => "images/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @image = Image.where({:id => the_id }).at(0)

    render({ :template => "images/show.html.erb" })
  end

  def create
    @image = Image.new
    @image.image = params.fetch("image_from_query")
    @image.owner_id = params.fetch("owner_id_from_query")

    if @image.valid?
      @image.save
      redirect_to("/images", { :notice => "Image created successfully." })
    else
      redirect_to("/images", { :notice => "Image failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @image = Image.where({ :id => the_id }).at(0)

    @image.image = params.fetch("image_from_query")
    @image.owner_id = params.fetch("owner_id_from_query")

    if @image.valid?
      @image.save
      redirect_to("/images/#{@image.id}", { :notice => "Image updated successfully."} )
    else
      redirect_to("/images/#{@image.id}", { :alert => "Image failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @image = Image.where({ :id => the_id }).at(0)

    @image.destroy

    redirect_to("/images", { :notice => "Image deleted successfully."} )
  end
end
