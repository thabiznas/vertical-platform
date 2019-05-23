class PaymentGateway::CreateSubscriptionService < PaymentGateway::Service
  ERROR_MESSAGE = 'Error while creating subscription'
  attr_accessor :user, :plan, :token, :subscription, :success
  
  def initialize(user:, plan:, token:, code:)
    @user = user
    @plan = plan
    @token = token
    @code = code
    @success = false
  end
  
  def run
    begin
      Subscription.transaction do
        create_client_subscription
        self.subscription = create_subscription
        @success = true
      end
    rescue PaymentGateway::CreateSubscriptionServiceError, 
           PaymentGateway::CreatePlanServiceError, 
           PaymentGateway::ClientError => e
      raise PaymentGateway::CreateSubscriptionServiceError.new(
          ERROR_MESSAGE, exception_message: e.message
        )
    end
  end
  
  private
  
  def create_client_subscription
    client.create_subscription!(
      customer: payment_gateway_customer,
      plan: payment_gateway_plan,
      coupon: Coupon.get(@code)
    )
  end
  
  def get_discount(code)
    # Normalize user input
    
  end
  
  def create_subscription
    Subscription.create!(user: user,
      plan: plan,
      start_date: Time.zone.now.to_date,
      end_date: plan.end_date_from,
      status: :active
    )
  end
  
  def payment_gateway_customer
    if user.stripe_id
      Stripe::Customer.retrieve(user.stripe_id)
    else
    create_customer_service = PaymentGateway::CreateCustomerService.new(
        user:user,
        token:token
      )
    create_customer_service.run
    end
  end
  
  def payment_gateway_plan
   Stripe::Plan.retrieve(plan.payment_plan_gateway_identifier)
  end
end