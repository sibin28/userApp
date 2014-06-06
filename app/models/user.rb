class User < ActiveRecord::Base
   attr_accessible :username, :password, :email, :mobile
   validates :username, :password, :email , :mobile , :presence => true
   validates :password, :confirmation => true
   
     
   EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
   def self.authenticate(username="", login_password="")
       
		user = User.find_by_username(username)
                password = User.find_by_password(login_password)
                if user && password
                      return user
                else
                      return false
                end
 
	#if user && user.match_password(login_password)
	#	return user
	#else
	#	return false
	#end
  end
  def match_password(login_password="")
        user = User.find_by_password(login_password)
	#encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
  end
end
