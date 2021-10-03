json.extract! photo, :id, :name, :photo_path_string, :created_at, :updated_at
json.url photo_url(photo, format: :json)
