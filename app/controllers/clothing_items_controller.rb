

class ClothingItemsController < ApplicationController
  def index_default
    @user = @current_user
    @clothing_items = ClothingItem.where({:owner_id => @user}).order({ :created_at => :desc })

    render({ :template => "clothing_items/index.html.erb" })
  end

  def index
    @user = User.where({:id => params.fetch("owner_id")})[0]
    @clothing_items = ClothingItem.where({:owner_id => @user}).order({ :created_at => :desc })

    render({ :template => "clothing_items/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @clothing_item = ClothingItem.where({:id => the_id }).at(0)

    render({ :template => "clothing_items/show.html.erb" })
  end

  def create
    @clothing_item = ClothingItem.new
    @clothing_item.name = params.fetch("name_from_query")
    @clothing_item.color = params.fetch("color_from_query")
    @clothing_item.pattern = params.fetch("pattern_from_query")
    @clothing_item.material = params.fetch("material_from_query")
    @clothing_item.size = params.fetch("size_from_query")
    @clothing_item.brand = params.fetch("brand_from_query")
    @clothing_item.retailer = params.fetch("retailer_from_query")
    @clothing_item.price = params.fetch("price_from_query")
    @clothing_item.price_units = "USD"
    @clothing_item.date_purchased = params.fetch("date_purchased_from_query")
    @clothing_item.category = params.fetch("category_from_query")
    @clothing_item.quantity = params.fetch("quantity_from_query")
    @clothing_item.description = params.fetch("description_from_query")
    @clothing_item.owner_id = @current_user[:id]
    image_url = params.fetch("default_image_url_from_query")
    new_default_image = Image.new
    new_default_image.owner_id = @current_user[:id]
    new_default_image.image = image_url
    new_default_image.save

    @clothing_item.default_image_id = new_default_image[:id]

    if @clothing_item.valid?
      @clothing_item.save
      redirect_to("/closet", { :notice => "Clothing item created successfully." })
    else
      redirect_to("/closet", { :notice => "Clothing item failed to create successfully." })
    end
  end

  def create_form
    render({ :template => "clothing_items/new.html.erb" })
  end

  def update
    the_id = params.fetch("id_from_path")
    @clothing_item = ClothingItem.where({ :id => the_id }).at(0)

    @clothing_item.name = params.fetch("name_from_query")
    @clothing_item.color = params.fetch("color_from_query")
    @clothing_item.pattern = params.fetch("pattern_from_query")
    @clothing_item.material = params.fetch("material_from_query")
    @clothing_item.size = params.fetch("size_from_query")
    @clothing_item.brand = params.fetch("brand_from_query")
    @clothing_item.retailer = params.fetch("retailer_from_query")
    @clothing_item.price = params.fetch("price_from_query")
    @clothing_item.price_units = params.fetch("price_units_from_query")
    @clothing_item.date_purchased = params.fetch("date_purchased_from_query")
    @clothing_item.category = params.fetch("category_from_query")
    @clothing_item.quantity = params.fetch("quantity_from_query")
    @clothing_item.description = params.fetch("description_from_query")
    #@clothing_item.owner_id = params.fetch("owner_id_from_query")
    #@clothing_item.default_image_id = params.fetch("default_image_id_from_query")

    if @clothing_item.valid?
      @clothing_item.save
      redirect_to("/clothing_item/#{@clothing_item.id}", { :notice => "Clothing item updated successfully."} )
    else
      redirect_to("/clothing_item/#{@clothing_item.id}", { :alert => "Clothing item failed to update successfully." })
    end
  end

  def edit
    the_id = params.fetch("id_from_path")
    @clothing_item = ClothingItem.where({:id => the_id }).at(0)
    render({ :template => "clothing_items/edit.html.erb" })
  end

  def generate_wardrobe
    populate_clothing_items(20, @current_user)
    redirect_to("/closet")
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @clothing_item = ClothingItem.where({ :id => the_id }).at(0)

    @clothing_item.destroy

    redirect_to("/closet", { :notice => "Clothing item deleted successfully."} )
  end

  def populate_clothing_items(times, user_id=nil)
    seed = Random.new(Time.now.to_i)
    0.upto(times) do |id|
      this_item = ClothingItem.new
      this_item.color = Faker::Color.color_name()
      patterns = ['plaid', 'stripe', 'houndstooth', 'paisley', 'gingham', 'ikat', 'meander', 'argyle', 'herringbone', 'tartan', 'toile', 'damask', 'polka dot', 'chintz']
      this_item.pattern = ''
      pattern_seed = seed.rand()
      if pattern_seed < 0.2
        pattern_index = seed.rand(0..patterns.length-1)
        this_item.pattern = patterns[pattern_index]
      else
        this_item.pattern = 'solid'
      end
      #TODO: Implement patterns and materials as tags, not choose one
      materials = ['leather', 'denim', 'silk', 'polyester', 'lace', 'cotton', 'linen', 'velvet', 'chiffon', 'corduroy', 'flannel', 'fleece', 'tweed', 'gabardine', 'muslin', 'cashmere', 'poplin', 'organza']
      this_item.material =materials[seed.rand(0..materials.length-1)]
      #Todo: Implement hierarchy for categories
      categories = ['skirt', 'footwear', 'dress', 'top', 'pants', 'accessories', 'shorts', 'athletic', 'jeans', 'outerwear', 'jacket', 'sweater', 'coat']
      this_item.category = categories[seed.rand(0..categories.length-1)]
      this_item.name = this_item.color + ' ' + this_item.material + ' ' + this_item.category
      sizes = ['xs', 's', 'm', 'l', 'xl']
      this_item.size = sizes[seed.rand(0..sizes.length-1)]
      brands = File.open("brands.txt").readlines.map(&:chomp)
      this_item.brand = brands[seed.rand(0..brands.length-1)]
      retailers = File.open("retailers.txt").readlines.map(&:chomp)
      this_item.retailer = retailers[seed.rand(0..retailers.length-1)]
      this_item.price = seed.rand(5..301)
      this_item.price_units = 'USD'
      this_item.date_purchased = Faker::Date.between(from: 5.years.ago, to: Date.today)
      this_item.quantity = 1
      this_item.description = ''
      case seed.rand(0..2)
      when 0
        this_item.description = Faker::Superhero.name
      when 1
        this_item.description = Faker::Superhero.power
      when 2
        this_item.description = Faker::Superhero.descriptor
      end
      this_item.owner_id = @current_user[:id]
      this_item.save

      this_default_image = Image.new
      this_default_image.owner_id = @current_user[:id]
      this_default_image.image = Faker::LoremFlickr.image(size: "500x500", search_terms: [this_item.color, this_item.category, this_item.material])
      this_default_image.save

      this_item.default_image_id = this_default_image[:id]
      this_item.save


      this_tag = ClothingTag.new
      this_tag.clothing_item_id = this_item[:id]
      this_tag.image_id = this_default_image[:id]
    end

  end


end



