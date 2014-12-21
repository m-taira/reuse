json.array!(@offers) do |offer|
  json.extract! offer, :id, :status, :item_id, :user_id
  json.url offer_url(offer, format: :json)
end
