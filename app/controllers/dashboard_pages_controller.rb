class DashboardPagesController < ApplicationController
  before_action :check_admin, only: [:admin]
  before_action :check_teacher, only: [:teacher]
  
  
  def student
  end
  
  def teacher
  end
  
  def admin
  end


  def check_admin
    if !current_user.admin 
      redirect_to :student
    end
  end
  
  def check_teacher
    if !current_user.teacher 
      redirect_to :student
    end
  end
  
  
    
end
