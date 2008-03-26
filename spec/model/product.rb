require File.dirname(__FILE__) + '/../../lib/acts_as_currency'

class Product < ActiveRecord::Base
  acts_as_currency :price, :discount_price
end