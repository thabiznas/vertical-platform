namespace :custom do
  
  task :seed_db => :environment do
    puts "Removing plans stable, and seeding table"
    table = "plans"
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table} RESTART IDENTITY;")
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
    puts "You have refreshed plans"
  end 
  
end