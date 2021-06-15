class ImageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :image do |object|
    {
      location: object.location,
      image_url: object.image_url
    }
  end

  attributes :credit do |object|
    {
      source: object.source,
      author: object.author
    }
  end
end
