class User < ActiveRecord::Base

	has_many :user_provider, :dependent => :destroy
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable, :omniauthable,
	      :recoverable, :rememberable, :trackable, :validatable, :omniauth_providers => [:facebook, :google_oauth2]
end
