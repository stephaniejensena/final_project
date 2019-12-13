require 'faker'

def populate_users(times)
  user_values = []
  image_values = []
  seed = Random.new(Time.now.to_i)
  0.upto(times) do |id|
    this_user = {}
    this_user[:id] = User.count + id
    this_user[:created_at] = Time.now()
    this_user[:updated_at] = this_user[:created_at]
    this_user[:username] = Faker::Internet.username()
    this_user[:first_name] = Faker::Name.female_first_name()
    this_user[:last_name] = Faker::Name.last_name()
    this_user[:height] = seed.rand(59..72).to_s
    this_user[:pant_size] = (seed.rand(-1..10) * 2).to_s
    this_user[:shirt_size] = ''
    case seed.rand(0..4)
    when 0
      this_user[:shirt_size]='xs'
    when 1
      this_user[:shirt_size]='s'
    when 2
      this_user[:shirt_size]='m'
    when 3
      this_user[:shirt_size]='l'
    when 4
      this_user[:shirt_size]='xl'
    end
    this_user[:dress_size] = (seed.rand(-1..10) * 2).to_s
    this_user[:shoe_size] = seed.rand(4..10).to_s
    this_user[:pant_size_units] = 'US - W'
    this_user[:dress_size_units] = 'US - W'
    this_user[:shoe_size_units] = 'US - W'
    this_user[:height_units] = 'inches'
    this_user[:bio] = ''
    case seed.rand(0..4)
    when 0
      this_user[:bio] = Faker::Quotes::Shakespeare.hamlet_quote()
    when 1
      this_user[:bio] = Faker::Quotes::Shakespeare.romeo_and_juliet_quote()
    when 2
      this_user[:bio] = Faker::Quote.robin()
    when 3
      this_user[:bio] = Faker::Quote.yoda()
    when 4
      this_user[:bio] = Faker::Quote.famous_last_words()
    end
    this_user[:email] = Faker::Internet.email()
    this_user[:birthdate] = Faker::Date.between(from: 60.years.ago, to: 18.years.ago)
    this_profile_image = {}
    this_profile_image[:id] = Image.count + id
    this_profile_image[:created_at] = Time.now()
    this_profile_image[:updated_at] = this_profile_image[:created_at]
    this_profile_image[:owner_id] = this_user[:id]
    this_profile_image[:image] = Faker::LoremFlickr.image(size: "500x500", search_terms: ['person', 'face', 'smile'])
    this_user[:profile_picture_id] = this_profile_image[:id]
    user_values << this_user
    image_values << this_profile_image
  end
  User.insert_all!(user_values)
  Image.insert_all!(image_values)
  puts "There are now #{User.all.length} users in the database"
  puts "There are now #{Image.all.length} images in the database"
end


def populate_clothing_items(times, user_id=nil)
  clothing_item_values = []
  image_values = []
  clothing_item_tag_values = []
  seed = Random.new(Time.now.to_i)
  0.upto(times) do |id|
    this_item = {}
    this_item[:id] = ClothingItem.count + id
    this_item[:created_at] = Time.now()
    this_item[:updated_at] = this_item[:created_at]
    this_item[:color] = Faker::Color.color_name()
    patterns = ['plaid', 'stripe', 'houndstooth', 'paisley', 'gingham', 'ikat', 'meander', 'argyle', 'herringbone', 'tartan', 'toile', 'damask', 'polka dot', 'chintz']
    this_item[:pattern] = ''
    pattern_seed = seed.rand()
    if pattern_seed < 0.2
      pattern_index = seed.rand(0..patterns.length-1)
      this_item[:pattern] = patterns[pattern_index]
    else
      this_item[:pattern] = 'solid'
    end
    #TODO: Implement patterns and materials as tags, not choose one
    materials = ['leather', 'denim', 'silk', 'polyester', 'lace', 'cotton', 'linen', 'velvet', 'chiffon', 'corduroy', 'flannel', 'fleece', 'tweed', 'gabardine', 'muslin', 'cashmere', 'poplin', 'organza']
    this_item[:material]=materials[seed.rand(0..materials.length-1)]
    #Todo: Implement hierarchy for categories
    categories = ['skirt', 'footwear', 'dress', 'top', 'pants', 'accessories', 'shorts', 'athletic', 'jeans', 'outerwear', 'jacket', 'sweater', 'coat']
    this_item[:category] = categories[seed.rand(0..categories.length-1)]
    this_item[:name] = this_item[:color] + ' ' + this_item[:material] + ' ' + this_item[:category]
    sizes = ['xs', 's', 'm', 'l', 'xl']
    this_item[:size] = sizes[seed.rand(0..sizes.length-1)]
    brands = File.open("brands.txt").readlines.map(&:chomp)
    this_item[:brand] = brands[seed.rand(0..brands.length-1)]
    retailers = File.open("retailers.txt").readlines.map(&:chomp)
    this_item[:retailer] = retailers[seed.rand(0..retailers.length-1)]
    this_item[:price] = seed.rand(5..301)
    this_item[:price_units] = 'USD'
    this_item[:date_purchased] = Faker::Date.between(from: 5.years.ago, to: Date.today)
    this_item[:quantity] = 1
    this_item[:description] = ''
    case seed.rand(0..2)
    when 0
      this_item[:description] = Faker::Superhero.name
    when 1
      this_item[:description] = Faker::Superhero.power
    when 2
      this_item[:description] = Faker::Superhero.descriptor
    end
    this_item[:owner_id] = 1
    if user_id == nil
      found_owner = false
      while !found_owner
        candidate = seed.rand(0..User.count)
        if User.where({:id => candidate}).length > 0
          this_item[:owner_id] = candidate
          found_owner = true
        end
      end
    else
      this_item[:owner_id] = user_id
    end

    this_default_image = {}
    this_default_image[:id] = Image.count + id
    this_default_image[:created_at] = Time.now()
    this_default_image[:updated_at] = this_default_image[:created_at]
    this_default_image[:owner_id] = this_item[:owner_id]
    this_default_image[:image] = Faker::LoremFlickr.image(size: "500x500", search_terms: [this_item[:color], this_item[:category], this_item[:material]])
    this_item[:default_image_id] = this_default_image[:id]
    this_tag = {}
    this_tag[:id] = ClothingTag.count + id
    this_tag[:created_at] = Time.now()
    this_tag[:updated_at] = this_tag[:created_at]
    this_tag[:clothing_item_id] = this_item[:id]
    this_tag[:image_id] = this_default_image[:id]
    clothing_item_tag_values << this_tag
    image_values << this_default_image
    clothing_item_values << this_item
  end
  ClothingItem.insert_all!(clothing_item_values)
  Image.insert_all!(image_values)
  ClothingTag.insert_all!(clothing_item_tag_values)
  puts "There are now #{ClothingItem.all.length} items of clothing in the database"
  puts "There are now #{Image.all.length} images in the database"
  puts "There are now #{ClothingTag.all.length} clothing tags in the database"
end

def populate_friends(attempts)
  seed = Random.new(Time.now.to_i)
  User.all.each do |friender|
    attempt_count = 0;
    while attempt_count < attempts
      friendee_candidate = User.all[seed.rand(0..User.all.length-1)]
      if Friend.where({:friender_id => friendee_candidate[:id]}).where(:friendee_id => friender[:id]).length == 0 and Friend.where({:friender_id => friender[:id]}).where(:friendee_id => friendee_candidate[:id]).length == 0
        new_friend = {}
        new_friend[:created_at] = Time.now()
        new_friend[:updated_at] = new_friend[:created_at]
        new_friend[:friender_id] = friender[:id]
        new_friend[:friendee_id] = friendee_candidate[:id]
        new_friend[:accepted] = false
        if seed.rand() < 0.8
          new_friend[:accepted]= true
        end
        Friend.insert(new_friend)
      end
      attempt_count += 1
    end
  end
  puts "There are now #{Friend.all.length} friends in the database"
end

def populate_outfits(attempts)
  seed = Random.new(Time.now.to_i)
  User.all.each do |owner|
    closet = owner.clothes
    attempts.times do |attempt|
      new_outfit = {}
      new_outfit[:id] = Outfit.count + 1
      new_outfit[:created_at] = Time.now()
      new_outfit[:updated_at] = new_outfit[:created_at]
      new_outfit[:description] = Faker::Quotes::Shakespeare.king_richard_iii_quote()
      new_outfit[:owner_id] = owner[:id]

      this_default_image = {}
      this_default_image[:id] = Image.count + 1
      this_default_image[:created_at] = Time.now()
      this_default_image[:updated_at] = this_default_image[:created_at]
      this_default_image[:owner_id] = new_outfit[:owner_id]
      this_default_image[:image] = Faker::LoremFlickr.image(size: "500x500", search_terms: ['outfit'])
      new_outfit[:default_image_id] = this_default_image[:id]
      Image.insert!(this_default_image)

      default_outfit_tag = {}
      default_outfit_tag[:id] = OutfitTag.count + 1
      default_outfit_tag[:created_at] = Time.now
      default_outfit_tag[:updated_at] = default_outfit_tag[:created_at]
      default_outfit_tag[:outfit_id] = new_outfit[:id]
      default_outfit_tag[:image_id] = this_default_image[:id]
      OutfitTag.insert!(default_outfit_tag)

      outfit_components = [{},{},{}]
      outfit_components.each do |component|
        component[:id] = OutfitComponent.count + 1
        component[:created_at] = Time.now()
        component[:updated_at] = component[:created_at]
        component[:outfit_id] = new_outfit[:id]
        component[:clothing_item_id] = closet.all[seed.rand(0..closet.all.length-1)][:id]
        OutfitComponent.insert!(component)

        this_clothing_tag = {}
        this_clothing_tag[:id] = ClothingTag.count + 1
        this_clothing_tag[:created_at] = Time.now
        this_clothing_tag[:updated_at] = this_clothing_tag[:created_at]
        this_clothing_tag[:clothing_item_id] = component[:clothing_item_id]
        this_clothing_tag[:image_id] = this_default_image[:id]
        ClothingTag.insert!(this_clothing_tag)

      end

      Outfit.insert!(new_outfit)

    end
  end
  puts "There are now #{Outfit.all.length} outfits in the database"
  puts "There are now #{OutfitComponent.all.length} outfit components in the database"
  puts "There are now #{Image.all.length} images in the database"

end

def populate_wears(count)
  User.all.each do |owner|
    seed = Random.new(Time.now.to_i)
    closet = owner.outfits
    count.times do
      outfit = closet.all[seed.rand(0..closet.all.length-1)]
      last_purchase_date = outfit.outfit_components[0].clothing_item[:date_purchased]
      outfit.outfit_components.each do |component|
        this_date = component.clothing_item[:date_purchased]
        if this_date > last_purchase_date
          last_purchase_date = this_date
        end
      end
      this_wear = {}
      this_wear[:id] = Wear.count + 1
      this_wear[:created_at] = Time.now
      this_wear[:updated_at] = this_wear[:created_at]
      this_wear[:outfit_id] = outfit[:id]
      this_wear[:wear_date] = Faker::Date.between(from: last_purchase_date, to: Date.today)

      this_wear_image = {}
      this_wear_image[:id] = Image.count + 1
      this_wear_image[:created_at] = Time.now()
      this_wear_image[:updated_at] = this_wear_image[:created_at]
      this_wear_image[:owner_id] = outfit[:owner_id]
      this_wear_image[:image] = Faker::LoremFlickr.image(size: "500x500", search_terms: ['outfit'])
      this_wear[:image_id] = this_wear_image[:id]
      Image.insert!(this_wear_image)
      Wear.insert!(this_wear)
    end
  end
  puts "There are now #{Wear.all.length} wears in the database"
  puts "There are now #{Image.all.length} images in the database"
end

def populate_posts(posts_per_user, likes_per_post_max, comments_per_post_max)
  User.all.each do |owner|
    seed = Random.new(Time.now.to_i)
    images = owner.images
    posts_per_user.times do
      image = images[seed.rand(0..images.length-1)]
      new_post = {}
      new_post[:id] = Post.count + 1
      new_post[:created_at] = Time.now
      new_post[:updated_at] = new_post[:created_at]
      new_post[:just_friends] = true
      if seed.rand() < 0.7
        new_post[:just_friends] = false
      end
      new_post[:image_id] = image[:id]
      new_post[:caption] = Faker::Quotes::Shakespeare.romeo_and_juliet_quote
      Post.insert!(new_post)

      likes_per_post_max.times do
        if seed.rand() < 0.5
          new_like = {}
          new_like[:id] = Like.count + 1
          new_like[:created_at] = Time.now
          new_like[:updated_at] = new_like[:created_at]
          new_like[:liker_id] = User.all[seed.rand(0..User.all.length-1)][:id]
          new_like[:post_id] = new_post[:id]
          Like.insert!(new_like)
        end
      end
      comments_per_post_max.times do
        if seed.rand() < 0.5
          new_comment = {}
          new_comment[:id] = Comment.count + 1
          new_comment[:created_at] = Time.now
          new_comment[:updated_at] = new_comment[:created_at]
          new_comment[:commenter_id] = User.all[seed.rand(0..User.all.length-1)][:id]
          new_comment[:post_id] = new_post[:id]
          new_comment[:content] = Faker::Quotes::Shakespeare.hamlet_quote
          Comment.insert!(new_comment)
        end
      end

    end
  end
  puts "There are now #{Post.all.length} posts in the database"
  puts "There are now #{Like.all.length} likes in the database"
  puts "There are now #{Comment.all.length} comments in the database"
end



namespace(:dev) do
  desc "Hydrate the database with some dummy data to look at so that developing is easier"
  task({ :prime => :environment}) do
    User.delete_all
    Image.delete_all
    ClothingItem.delete_all
    ClothingTag.delete_all
    Friend.delete_all
    Outfit.delete_all
    OutfitTag.delete_all
    OutfitComponent.delete_all
    Post.delete_all
    Wear.delete_all
    Like.delete_all
    Comment.delete_all
    populate_users(50)
    populate_clothing_items(1000)
    populate_friends(10)
    populate_outfits(10)
    populate_wears(20)
    populate_posts(15, 20, 20)

  end
end
