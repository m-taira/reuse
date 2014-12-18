json.array!(@items) do |item|
  json.extract! item, :id, :name, :description, :category, :image1, :image2, :image3, :prefecture, :city, :classification, :status, :user_id
  json.url item_url(item, format: :json)
end
