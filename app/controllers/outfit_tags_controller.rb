class OutfitTagsController < ApplicationController
  def index
    @outfit_tags = OutfitTag.all.order({ :created_at => :desc })

    render({ :template => "outfit_tags/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @outfit_tag = OutfitTag.where({:id => the_id }).at(0)

    render({ :template => "outfit_tags/show.html.erb" })
  end

  def create
    @outfit_tag = OutfitTag.new
    @outfit_tag.outfit_id = params.fetch("outfit_id_from_query")
    @outfit_tag.image_id = params.fetch("image_id_from_query")

    if @outfit_tag.valid?
      @outfit_tag.save
      redirect_to("/outfit_tags", { :notice => "Outfit tag created successfully." })
    else
      redirect_to("/outfit_tags", { :notice => "Outfit tag failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @outfit_tag = OutfitTag.where({ :id => the_id }).at(0)

    @outfit_tag.outfit_id = params.fetch("outfit_id_from_query")
    @outfit_tag.image_id = params.fetch("image_id_from_query")

    if @outfit_tag.valid?
      @outfit_tag.save
      redirect_to("/outfit_tags/#{@outfit_tag.id}", { :notice => "Outfit tag updated successfully."} )
    else
      redirect_to("/outfit_tags/#{@outfit_tag.id}", { :alert => "Outfit tag failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @outfit_tag = OutfitTag.where({ :id => the_id }).at(0)

    @outfit_tag.destroy

    redirect_to("/outfit_tags", { :notice => "Outfit tag deleted successfully."} )
  end
end
