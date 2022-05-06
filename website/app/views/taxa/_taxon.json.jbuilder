json.extract! taxon, :id, :name, :description, :link, :cover_photo, :created_at, :updated_at
json.url taxon_url(taxon, format: :json)
