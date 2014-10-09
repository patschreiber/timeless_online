class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :username

  validates :username, 
  :uniqueness => {
    :case_sensitive => false
  },
  length: { in: 3..155555 }

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login

  has_one :user_stat
  has_many :user_inventories
  has_many :user_skills
  has_many :skills, through: :user_skills
  has_many :user_magics
  has_many :magics, through: :user_magics

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

end
