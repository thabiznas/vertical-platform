# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Stripe.api_key = Rails.application.secrets.stripe_public
res = Stripe::Plan.all 
res[:data].each do |plan| 
  Plan.create!(
    payment_plan_gateway_identifier: plan.id, 
    name: plan.nickname ? plan.nickname : plan.id, 
    price_cents: plan.amount,
    interval:plan.interval, 
    interval_count: 1,
    status: :active)
end