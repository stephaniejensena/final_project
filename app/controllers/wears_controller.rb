class WearsController < ApplicationController
  def index
    @wears = Wear.all.order({ :created_at => :desc })

    render({ :template => "wears/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @wear = Wear.where({:id => the_id }).at(0)

    render({ :template => "wears/show.html.erb" })
  end

  def create
    @wear = Wear.new
    @wear.image_id = params.fetch("image_id_from_query")
    @wear.outfit_id = params.fetch("outfit_id_from_query")

    if @wear.valid?
      @wear.save
      redirect_to("/wears", { :notice => "Wear created successfully." })
    else
      redirect_to("/wears", { :notice => "Wear failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @wear = Wear.where({ :id => the_id }).at(0)

    @wear.image_id = params.fetch("image_id_from_query")
    @wear.outfit_id = params.fetch("outfit_id_from_query")

    if @wear.valid?
      @wear.save
      redirect_to("/wears/#{@wear.id}", { :notice => "Wear updated successfully."} )
    else
      redirect_to("/wears/#{@wear.id}", { :alert => "Wear failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @wear = Wear.where({ :id => the_id }).at(0)

    @wear.destroy

    redirect_to("/wears", { :notice => "Wear deleted successfully."} )
  end
end
