class Category < ActiveRecord::Base
  has_and_belongs_to_many :articles

  default_scope lambda { order('categories.name') }

  scope :by_id, lambda { where("categories.id = ? ",:id)}
end
