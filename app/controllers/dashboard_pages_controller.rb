class DashboardPagesController < ApplicationController
  before_action :check_admin, only: [:admin]
  before_action :check_teacher, only: [:teacher]
  before_action :check_student, only: [:student]
  
  
  def student
  end
  
  def teacher
  end
  
  def admin
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
  
    
end
