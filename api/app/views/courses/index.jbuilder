json.items do
  json.array! @courses do |course|
    json.extract! course,
      :id,
      :name,
      :details,
      :created_at,
      :updated_at
  end
end
