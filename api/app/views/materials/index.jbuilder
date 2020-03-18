json.items do
  json.array! @materials do |material|
    json.extract! material,
      :id,
      :name,
      :path,
      :kind,
      :created_at,
      :updated_at
  end
end
