require File.dirname(__FILE__) + '/spec_helper'
require File.dirname(__FILE__) + '/model/product'
require File.dirname(__FILE__) + '/model/consultant'

# The following spec shows the problem...
describe 'A model, consultant, that does not call acts_as_currency' do
  
  it "will lose values after the dollar sign in decimal fields when using a '$'" do
    
    consultant = Consultant.new
    consultant.name = 'Joe Testing'
    consultant.hourly_rate = '$100'
    
    consultant.hourly_rate.should == BigDecimal.new('0')
    
  end
  
end

# ...and this spec shows the solution!
describe 'A model, product, that calls acts_as_currency' do
  
  it "will allow '$' character in specified price fields" do
  
    product = Product.new
    product.description = 'Sample Product'
    product.quantity = 100
    product.price = '$100.32'
    product.discount_price = '$10.53'
    
    product.price.should == BigDecimal.new('100.32')
    product.discount_price.should == BigDecimal.new('10.53')
    
    product.discount_price = 10.53
    product.discount_price.should == BigDecimal.new('10.53')
  
  end
  
end
