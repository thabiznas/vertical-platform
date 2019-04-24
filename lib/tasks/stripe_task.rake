namespace :custom do
  
  task :seed_db => :environment do
    puts "Removing plans stable, and seeding table"

    Stripe.api_key = Rails.application.secrets.stripe_public
    plans = Plan.all.map {|plan| plan.name}
    res = Stripe::Plan.all 
    res[:data].each do |plan| 
      name = plan.nickname ? plan.nickname : plan.id
      puts name
      unless plans.include? name
        Plan.create!(
          payment_plan_gateway_identifier: plan.id, 
          name: plan.nickname ? plan.nickname : plan.id, 
          price_cents: plan.amount,
          interval:plan.interval, 
          interval_count: 1,
          status: :active)
      end
    end
    puts "You have refreshed plans"
  end 
  
end