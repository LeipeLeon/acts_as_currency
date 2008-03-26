class ActiveRecord::Base

	def self.acts_as_currency(*args)

		args.each do |arg|
		
			define_method arg.to_s + '=' do |currency_string|
				currency_string.gsub!(/^\$/, '') if currency_string =~ /^\$/
				write_attribute(arg, currency_string)
			end
		
		end

		define_method 'validate' do
			args.each { |arg| errors.add(arg, "should be at least 0.01") if eval(arg.to_s).nil? || eval(arg.to_s) < 0.01 }
		end
			
	end

end
