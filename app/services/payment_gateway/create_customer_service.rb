class PaymentGateway::CreateCustomerService < PaymentGateway::Service
  EXCEPTION_MESSAGE =  "Error creating customer"
  attr_accessor :user
  
  
  def initialize(user:)
    @user = user
  end
  
  def run
    begin
      User.transaction do
        client.create_customer!(email: user.email).tap do |customer|
          user.update!(stripe_id: customer.id)
        end
      end
    rescue ActiveRecord::RecordInvalid, PaymentGateway::ClientError => e
      raise PaymentGateway::CreateCustomerServiceError.new( EXCEPTION_MESSAGE, exception_message: e.message)
    else
      # other exception
    ensure
      # always executed
    end
  end
end