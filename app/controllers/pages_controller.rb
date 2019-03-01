class PagesController < ApplicationController
  
before_action :is_signed_in?

def is_signed_in?
   if user_signed_in?
      redirect_to :admin
   end
end

skip_before_filter

def home
end

def method
end

def pricing
end

def contact
end

def join
end

def enterprise
end
  
def faq
end

def medellin
end

def jorge_carrasco
end

def mya_alverez
end

def maria_jose_montiel
end

def test
end

def test_2
end

end