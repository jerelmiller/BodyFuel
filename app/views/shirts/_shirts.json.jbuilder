json.(shirts) do |json, shirt|
  json.partial! 'shirts/shirt', shirt: shirt
end