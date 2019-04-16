class DashboardPagesController < ApplicationController
  before_action :check_admin, only: [:admin]
  before_action :check_teacher, only: [:teacher]
  before_action :check_student, only: [:student]
  before_action :check_subscription
  

    layout 'dashboard'
  
  
   @books = Book.all
  
  
  def student
 
  end
  
  def teacher
  end
  
  def admin
  end
  
  def quizes
  end
  
  def tests
  end
  
  def book_a_lesson
    puts current_user
    puts 'current_user'
  end
  
  def resource_book
  end
  
  def resource_music
  end
  
  def resource_tv
  end
  
  def quizes
  end

  def cards
  end
  
  def update_card
    PaymentGateway::StripeClient.new.update_card(
      identifier: current_user.stripe_id, 
      token:  params[:payment_gateway_token])
    redirect_to cards_path, notice: "You have successfully updated your card!"
  end

  def check_admin
    if !current_user.admin 
      redirect_to :teacher
    end
  end
  
  def check_teacher
    if !current_user.teacher 
      redirect_to :student
    end
  end
  
    def check_student
      if !current_user
      redirect_to :new_user_registration
      end
    end

  
    def check_subscription
      if !current_user.subscribed 
      redirect_to :plans
      end
    end
    
end
