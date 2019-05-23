class Coupon < ActiveRecord::Base
  has_many :subcriptions
  validates_presence_of :code, :discount_percent
  validates_uniqueness_of :code
  
  def self.get(code)
    where(code: normalize_code(code)).
    where('expires_at > ? OR expires_at IS NULL', Time.now).
    take
  end
  
  def discount_percent_human
    if discount_percent.present?
      discount_percent.to_s + "%"
    end
  end

  private

  def self.normalize_code(code)
    code.gsub(/\s+/, '').upcase
  end
  
end
