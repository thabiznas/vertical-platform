class PaymentGateway::CreateSubscriptionService < PaymentGateway::Service
  ERROR_MESSAGE = 'Error while creating subscription'
  attr_accessor :user, :plan, :token, :subscription, :success
  
  def initialize(user:, plan:, token:)
    @user = user
    @plan = plan
    @token = token
    @success = false
  end
  
  def run
    begin
      Subscription.transaction do
        create_client_subscription
        self.subscription = create_subscription
      end
    rescue PaymentGateway::CreateSubscriptionService, 
           PaymentGateway::CreatePlanService, 
           PaymentGateway::Client => e
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
      token: token
    )
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
    create_customer_service = PaymentGateway::CreateCustomerService.new(
        user:user
      )
    create_customer_service.run
  end
  
  def payment_gateway_plan
    get_plan_service = PaymentGateway::GetPlanService.new(plan:plan)
    get_plan_service.run
  end
end