require 'bcrypt'
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   attr_accessor :password
   validates_uniqueness_of :email
   validates_length_of :email, :within => 5..50
   validates_length_of :password, :within => 5..50
   validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :multiline => true,:message=>'email invalid?'
   validates_confirmation_of :password

   has_one :profile
   has_many :articles, -> { order('published_at DESC,title ASC') },
                        :dependent => :nullify
   has_many :replies, :through => :articles, :source => :comments

   #has_secure_password

   before_save :encrypt_new_password

   def self.authenticate(email,password)
     user = find_by_email(email)
     return user if user && user.authenticated?(password)
   end

   def authenticated?(password)
     BCrypt::Password.new(hashed_password) == password
   end

   protected
     def encrypt_new_password
       return if password.blank?
       self.hashed_password = encrypt(password)
     end

     def password_required?
       hashed_password.blank? || password.present?
     end

     def encrypt(string)
       BCrypt::Password.create(string)
     end
      
end
