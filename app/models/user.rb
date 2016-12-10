class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :permissions
  has_many :roles, through: :permissions
  has_many :articles

  has_many :contracts, foreign_key: :owner_id

  has_many :tenant_contracts, class_name: 'Contract', foreign_key: :tenant_id

  after_create :assign_role_to_user

  def role? (role)
  	self.roles.pluck(:name).include? role
  end

  private
  def assign_role_to_user
  	Permission.create(user_id: self.id, role_id: Role.last.id )
  end
end
