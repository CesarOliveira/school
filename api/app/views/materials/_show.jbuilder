json.material do
  json.extract! @material,
    :id,
    :name,
    :path,
    :kind,
    :created_at,
    :updated_at

  json.course do
    json.extract! @material.course,
      :id,
      :name
  end
end
