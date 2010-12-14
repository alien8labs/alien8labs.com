ActiveRecord::Base.instance_eval do     
  def per_page; Rails.env == 'test' ? 2 : 10; end   
end

