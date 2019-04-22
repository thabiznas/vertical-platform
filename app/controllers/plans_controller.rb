class PlansController < ApplicationController

  def index
    @plans  = Plan.active
    fresh_when(@plans)
    
    render :layout => 'dashboard'
    
    
  end
end
