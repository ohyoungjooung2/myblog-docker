class CategoriesController < ApplicationController
     before_action :authenticate_user!, except: [ :show]
     before_action :set_category , only: [:show,:index]


     def index
       @categories=Category.all
     end

     def show
       articles=Article.all
       @articles=Category.friendly.find(params[:id]).articles(published_at: :desc).page params[:page]
       render template: "articles/shared/_index"
     end




     private
     def set_category
       @category = Category.friendly.find(params[:id])
     end

     # Never trust parameters from the scary internet, only allow the white list through.
     def category_params
       params.require(:category).permit(:name,:created_at,:updated_at)
     end

end
