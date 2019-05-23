class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :plan
  belongs_to  :coupon
  enum status: {active: 0, inactive: 1, canceled: 2}
end
