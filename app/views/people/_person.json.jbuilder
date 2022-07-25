json.extract! person, :id, :name, :phone, :email, :linkedin, :facebook, :website, :address, :country, :portrait, :avatar, :bio, :interests, :is_public, :created_at, :updated_at
json.url person_url(person, format: :json)
