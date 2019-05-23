json.extract! coupon, :id, :code, :discount_percent, :expires_at, :description, :created_at, :updated_at
json.url coupon_url(coupon, format: :json)
