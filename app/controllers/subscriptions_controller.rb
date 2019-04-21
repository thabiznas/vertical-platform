class SubscriptionsController < ApplicationController
  rescue_from PaymentGateway::ServiceError do |e|
    puts e
    redirect_to root_path, alert: e.message
  end
  
  before_action :authenticate_user!
  before_action :load_plan
     
  
  def show
    @subscription = current_user.subscriptions.find(params[:id])
  end 
  
  def new
    @subscription =  Subscription.new
  end 
  
  def update
    
  end
  
  def create
    service =  PaymentGateway::CreateSubscriptionService.new(
      user: current_user,
      plan: @plan,
      token: params[:payment_gateway_token]
      )
    if service.run && service.success
      redirect_to plan_subscription_path(@plan, service.subscription), notice: "You have successfully subcribed!"
    else
      render :new
    end
  end
  
  def destroy
    customer = PaymentGateway::Client.new.lookup_customer(current_user.stripe_id)
    customer.subscriptions.retrieve(current_user.stripe_subscription_id).delete
    current_user.update(stripe_subscription_id: nil)

    redirect_to root_path, notice: "Your subscription has been cancelled."
  end
  
  private
  def load_plan
    @plan = Plan.find(params[:plan_id])
  end
  
  def authenticate_user!
      # check if current user is admin
    unless current_user
        # if current_user is not admin redirect to some route
        redirect_to '/users/sign_up'
    end
      # if current_user is admin he will proceed to edit action
  end
  
end 