class ActiveRecord::Base
  include ActionView::Helpers::NumberHelper # for currency formatting

  def self.acts_as_currency(*args)

    args.each do |meth|
      define_method "formatted_#{meth}" do
        number_to_currency(self.send(meth))
      end
    end

		define_method 'validate' do
			args.each { |arg| errors.add(arg, "should be at least 0.01") if eval(arg.to_s).nil? || eval(arg.to_s) < 0.01 }
		end
			
	end

end
