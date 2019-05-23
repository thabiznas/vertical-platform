class PaymentGateway::StripeClient
  def initialize()
    Stripe.api_key = Rails.application.secrets.stripe_public
  end
  
  def lookup_customer(identifier:)
    handle_client_error do
      @lookup_customer ||= Stripe::Customer.retrieve(identifier)
    end
  end
  
  def lookup_plan(identifier:)
      handle_client_error do
        @lookup_plan ||= Stripe::Plan.retrieve(identifier)
      end
  end
  
  def lookup_event(identifier:)
    handle_client_error do
      @lookup_event ||= Stripe::Event.retrieve(identifier)
    end
  end
  
  def create_customer!(options={})
    handle_client_error do
      puts options
      Stripe::Customer.create(
        email: options[:email],
        source: options[:source],
        name: options[:name]
        )
    end
  end
  
  def update_card(identifier:, token:)
    customer = Stripe::Customer.retrieve(identifier)
    puts customer
    Stripe::Customer.update(customer.id, {
    source: token,
    })

  end
  
  def create_plan!(product_name, options={})
    handle_client_error do
      Stripe::Plan.create(
        id: options[:id],
        amount: options[:amount],
        currency: options[:currency] || 'usd',
        interval: options[:interval] || 'month',
        product: {
          name: product_name
        }
        )
    end
  end
  
  def create_subscription!(customer: , plan:, coupon:)
    handle_client_error do
      customer.subscriptions.create(plan: plan.id, coupon: coupon ? coupon.code : '')
      puts customer
      #customer.update(subscribed: true)
    end
  end
  
  
  private
  def handle_client_error(message=nil, &block)
    begin
      yield
    rescue Stripe::StripeError => e
      puts e
      raise PaymentGateway::StripeClientError.new(e.message,  exception_message: e.message)
    end
  end
end