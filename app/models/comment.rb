class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  validates_presence_of :name, :email, :body
  validate :article_should_be_published

  after_create :email_article_author

  def article_should_be_published
    errors.add(:article_id,"is not published yet") if article && !article.published?
  end
  
  def owned_by?(owner)
   return false unless owner.is_a?(User)
   user == owner
  end

  def email_article_author
  end
end
