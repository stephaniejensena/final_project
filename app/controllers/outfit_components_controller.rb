class OutfitComponentsController < ApplicationController
  def index
    @outfit_components = OutfitComponent.all.order({ :created_at => :desc })

    render({ :template => "outfit_components/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @outfit_component = OutfitComponent.where({:id => the_id }).at(0)

    render({ :template => "outfit_components/show.html.erb" })
  end

  def create
    @outfit_component = OutfitComponent.new
    @outfit_component.clothing_item_id = params.fetch("clothing_item_id_from_query")
    @outfit_component.outfit_id = params.fetch("outfit_id_from_query")

    if @outfit_component.valid?
      @outfit_component.save
      redirect_to("/outfit_components", { :notice => "Outfit component created successfully." })
    else
      redirect_to("/outfit_components", { :notice => "Outfit component failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @outfit_component = OutfitComponent.where({ :id => the_id }).at(0)

    @outfit_component.clothing_item_id = params.fetch("clothing_item_id_from_query")
    @outfit_component.outfit_id = params.fetch("outfit_id_from_query")

    if @outfit_component.valid?
      @outfit_component.save
      redirect_to("/outfit_components/#{@outfit_component.id}", { :notice => "Outfit component updated successfully."} )
    else
      redirect_to("/outfit_components/#{@outfit_component.id}", { :alert => "Outfit component failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @outfit_component = OutfitComponent.where({ :id => the_id }).at(0)

    @outfit_component.destroy

    redirect_to("/outfit_components", { :notice => "Outfit component deleted successfully."} )
  end
end
