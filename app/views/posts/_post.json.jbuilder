json.extract! post, :id, :title, :string, :body, :text, :category, :string, :permalink, :string, :meta_title, :string, :meta_description, :text, :no_index, :boolean, :created_at, :updated_at
json.url post_url(post, format: :json)
