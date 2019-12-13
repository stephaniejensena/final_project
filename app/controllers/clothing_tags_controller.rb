class ClothingTagsController < ApplicationController
  def index
    @clothing_tags = ClothingTag.all.order({ :created_at => :desc })

    render({ :template => "clothing_tags/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @clothing_tag = ClothingTag.where({:id => the_id }).at(0)

    render({ :template => "clothing_tags/show.html.erb" })
  end

  def create
    @clothing_tag = ClothingTag.new
    @clothing_tag.clothing_item_id = params.fetch("clothing_item_id_from_query")
    @clothing_tag.image_id = params.fetch("image_id_from_query")

    if @clothing_tag.valid?
      @clothing_tag.save
      redirect_to("/clothing_tags", { :notice => "Clothing tag created successfully." })
    else
      redirect_to("/clothing_tags", { :notice => "Clothing tag failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @clothing_tag = ClothingTag.where({ :id => the_id }).at(0)

    @clothing_tag.clothing_item_id = params.fetch("clothing_item_id_from_query")
    @clothing_tag.image_id = params.fetch("image_id_from_query")

    if @clothing_tag.valid?
      @clothing_tag.save
      redirect_to("/clothing_tags/#{@clothing_tag.id}", { :notice => "Clothing tag updated successfully."} )
    else
      redirect_to("/clothing_tags/#{@clothing_tag.id}", { :alert => "Clothing tag failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @clothing_tag = ClothingTag.where({ :id => the_id }).at(0)

    @clothing_tag.destroy

    redirect_to("/clothing_tags", { :notice => "Clothing tag deleted successfully."} )
  end
end
