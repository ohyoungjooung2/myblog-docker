require 'bcrypt'
class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   paginates_per 5


   has_one :profile
   has_many :articles, -> { order('published_at DESC,title ASC') },
                        :dependent => :nullify
   has_many :replies, :through => :articles, :source => :comments



end
