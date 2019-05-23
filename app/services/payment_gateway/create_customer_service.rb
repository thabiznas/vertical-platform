class PaymentGateway::CreateCustomerService < PaymentGateway::Service
  EXCEPTION_MESSAGE =  "Error creating customer"
  attr_accessor :user, :token
  
  
  def initialize(user:, token:)
    @user = user
    @token = token
  end 
  
  def run
    begin
      User.transaction do
        client.create_customer!(email: user.email, source: token, name: user.name).tap do |customer|
          user.update(stripe_id: customer.id)
        end
      end
    rescue ActiveRecord::RecordInvalid, PaymentGateway::ClientError => e
      puts "Error here"
      raise PaymentGateway::CreateCustomerServiceError.new( EXCEPTION_MESSAGE, exception_message: e.message)
    end
  end
end