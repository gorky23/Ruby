json.extract! user, :id, :name, :secondname, :created_at, :updated_at
json.url user_url(user, format: :json)
