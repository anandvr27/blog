class Contract < ActiveRecord::Base
	belongs_to :user 
	belongs_to :tenant, class_name: 'User'
	belongs_to :owner, class_name: 'User'

end
