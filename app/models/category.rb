class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged,:history]
  validates_presence_of :name, :slug
  has_and_belongs_to_many :articles

  default_scope lambda { order('categories.name') }

  #scope :by_id, lambda { where("categories.id = ? ",:id)}
end
