module ArticlesHelper
      def categories_articles(category_id)
       articles=Article.all
       @articles=Category.find(1).articles(published_at: :desc).page params[:page]
      end
end
