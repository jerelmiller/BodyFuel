json.(cart_shirts) do |json, cart_shirt|
  json.partial! cart_shirt
end